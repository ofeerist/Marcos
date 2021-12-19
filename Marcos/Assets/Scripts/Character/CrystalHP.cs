using System;
using Character.Player.Weapon.Obstacle;
using TMPro;
using UniRx;
using UnityEngine;

namespace Character
{
    public class CrystalHP : MonoBehaviour, IDamageable
    {
        public event IDamageable.Damage OnDamage;
        public event Action OnDeath;

        [SerializeField] private float _maxHP;
        [SerializeField] private float _currentHP;
        [SerializeField] private GameDefeat _gameDefeat;
        [SerializeField] private TextMeshPro _textMesh;
        [SerializeField] private Transform _cursor;
        
        public float MaxHP => _maxHP;
        public float CurrentHP => _currentHP;

        private BulletObstacle _bulletObstacle;

        public void AddHP(float count)
        {
            if (_currentHP + count > _maxHP) _currentHP = _maxHP;
            else _currentHP += count;
            
            _textMesh.text = $"{Mathf.Round(_currentHP * 100 / _maxHP)}%";

            OnDamage?.Invoke(-count, _currentHP, _maxHP);
        }
        
        private void Start()
        {
            _currentHP = MaxHP;
            
            var _transform = _textMesh.rectTransform;
            Observable.EveryUpdate().Subscribe(x =>
            {
                var eulerAngles = _transform.eulerAngles;
                eulerAngles = new Vector3(eulerAngles.x, _cursor.eulerAngles.y,
                    eulerAngles.z);
                _transform.eulerAngles = eulerAngles;
            }).AddTo(this);

            _bulletObstacle = GetComponent<BulletObstacle>();
        }
        
        public void TakeDamage(float damage)
        {
            _currentHP -= damage;

            _textMesh.text = $"{Mathf.Round(_currentHP * 100 / _maxHP)}%";
            _bulletObstacle.CreateImpact(transform.position, Vector3.up);
            
            OnDamage?.Invoke(damage, _currentHP, _maxHP);
            if (_currentHP <= 0)
            {
                OnDeath?.Invoke();
                _gameDefeat.Defeat();
            }
        }
    }
}