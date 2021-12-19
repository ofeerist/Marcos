using System;
using System.Collections;
using AmazingAssets.AdvancedDissolve;
using Character.Player.Interactable;
using Misc;
using UniRx;
using UnityEngine;

namespace Character.Enemy
{
    public class EnemyHealth : PooledItem, IDamageable
    {
        public event IDamageable.Damage OnDamage;
        public event Action OnDeath;
        public event Action OnRevive;
        
        [SerializeField] private ParticleSystem _onDeathParticle;

        [SerializeField] private AudioSource _audioSource;
        [SerializeField] private AudioClip _reviveSound;
        [SerializeField] private AudioClip _deathSound;
        [SerializeField] private float _volume;
        
        [SerializeField] private float _disposeSpeed;
        [SerializeField] private float _reviveSpeed;
        
        [SerializeField] private float _maxHP;
        private float _currentHP;
        
        public float MaxHP => _maxHP;
        public float CurrentHP => _currentHP;

        private Animator _animator;
        private static readonly int DeadHash = Animator.StringToHash("Dead");

        [SerializeField] private Renderer[] _renderers;
        private readonly SerialDisposable _serialDisposable = new SerialDisposable();
        private Collider _collider;

        public bool Dead { get; private set; }
        
        private void Start()
        {
            if (_animator != null) return;
            
            _animator = GetComponentInChildren<Animator>();
            _collider = GetComponent<Collider>();

            _serialDisposable.AddTo(this);

            _currentHP = MaxHP;
        }

        public void Init()
        {
            _animator = GetComponentInChildren<Animator>();
            _collider = GetComponent<Collider>();

            _serialDisposable.AddTo(this);

            _currentHP = MaxHP;
        }
        
        
        public void TakeDamage(float damage)
        {
            _currentHP -= damage;
            
            if (_currentHP <= 0 && !Dead)
            {
                Death();
                return;
            }
            
            OnDamage?.Invoke(damage, _currentHP, _maxHP);
        }

        public void Revive()
        {
            Dead = false;
            _audioSource.enabled = true;
            _animator.SetBool(DeadHash, false);
            _collider.enabled = true;
            OnRevive?.Invoke();
            
            _audioSource.PlayOneShot(_reviveSound, _volume);
            _serialDisposable.Disposable = Observable.FromMicroCoroutine(ReviveAnim).Subscribe();
        }
        
        private void Death()
        {
            Dead = true;
            _animator.SetBool(DeadHash, Dead);
            _collider.enabled = false;
            OnDeath?.Invoke();
            
            if (_onDeathParticle != null)
                Instantiate(_onDeathParticle, _onDeathParticle.transform.position, _onDeathParticle.transform.rotation).gameObject.SetActive(true);
            
            _audioSource.PlayOneShot(_deathSound, _volume);
            _serialDisposable.Disposable = Observable.Timer(TimeSpan.FromSeconds(1f)).Subscribe(x =>
                _serialDisposable.Disposable = Observable.FromMicroCoroutine(DeathDispose).Subscribe());
        }

        private IEnumerator DeathDispose()
        {
            var clip = 0f;
            while (clip < 1)
            {
                yield return null;

                foreach (var rebn in _renderers)
                {
                    AdvancedDissolveProperties.Cutout.Standard.UpdateLocalProperty(rebn.material,
                        AdvancedDissolveProperties.Cutout.Standard.Property.Clip, clip);
                }

                clip += _disposeSpeed * Time.deltaTime;
            }

            _audioSource.enabled = false;
            ReturnToPool();
        }
        private IEnumerator ReviveAnim()
        {
            var clip = 1f;
            while (clip > 0)
            {
                yield return null;

                foreach (var rebn in _renderers)
                {
                    AdvancedDissolveProperties.Cutout.Standard.UpdateLocalProperty(rebn.material,
                        AdvancedDissolveProperties.Cutout.Standard.Property.Clip, clip);
                }

                clip -= _reviveSpeed * Time.deltaTime;
            }
            
            foreach (var rebn in _renderers)
            {
                AdvancedDissolveProperties.Cutout.Standard.UpdateLocalProperty(rebn.material,
                    AdvancedDissolveProperties.Cutout.Standard.Property.Clip, 0f);
            }
        }
    }
}