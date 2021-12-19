using System;
using UniRx;
using UnityEngine;

namespace Character.Enemy
{
    public class EnemyAttack : MonoBehaviour
    {
        [SerializeField] private LayerMask _enemyLayer;
        [SerializeField] private float _attackDistance;
        [SerializeField] private float _damageDistance;
        [SerializeField] private EnemyHealth _health;
        [SerializeField] private EnemyMovement _movement;
        [SerializeField] private float _cooldown;
        
        private readonly Collider[] _results = new Collider[1];

        private Animator _animator;
        private static readonly int Attack1 = Animator.StringToHash("Attack");

        [SerializeField] private AudioSource _source;
        [SerializeField] private AudioClip _prepareToAttack;
        [SerializeField] private float _volume;
        [SerializeField] private float _prepareToAttackOffset;
        [SerializeField] private float _offsetFromPrepareToDamage;

        [SerializeField] private float _damage;

        private readonly SerialDisposable _serialDisposable = new SerialDisposable();

        private bool _inAttack;
        
        private void Start()
        {
            _animator = GetComponentInChildren<Animator>();

            _health.OnDeath += () =>
            {
                _serialDisposable.Disposable?.Dispose();
                enabled = false;
            };

            Observable.EveryUpdate().Subscribe(x =>
            {
                if (_inAttack) return;
            
                var size = Physics.OverlapSphereNonAlloc(transform.position, _attackDistance, _results, _enemyLayer);
                if (size > 0)
                    Attack();
            }).AddTo(this);

            _serialDisposable.AddTo(this);
        }

        private void Attack()
        {
            _inAttack = true;

            var speed = _movement.speed;
            _movement.speed = 0;

            _serialDisposable.Disposable = Observable.NextFrame().Subscribe(c =>
            {
                _animator.SetTrigger(Attack1);
                _serialDisposable.Disposable = Observable.Timer(TimeSpan.FromSeconds(_prepareToAttackOffset)).Subscribe(
                    n =>
                    {
                        _source.PlayOneShot(_prepareToAttack, _volume);
                        _serialDisposable.Disposable = Observable
                            .Timer(TimeSpan.FromSeconds(_offsetFromPrepareToDamage)).Subscribe(x =>
                            {
                                var size = Physics.OverlapSphereNonAlloc(transform.position, _damageDistance, _results,
                                    _enemyLayer);
                                if (size > 0)
                                    _results[0].GetComponent<IDamageable>().TakeDamage(_damage);

                                _serialDisposable.Disposable =
                                    Observable.Timer(TimeSpan.FromSeconds(_cooldown)).Subscribe(z =>
                                    {
                                        _inAttack = false;
                                        _movement.speed = speed;
                                    });
                            });
                    });
            });
        }
    }
}