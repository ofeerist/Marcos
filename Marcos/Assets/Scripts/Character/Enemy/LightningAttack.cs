using System;
using UniRx;
using UnityEngine;

namespace Character.Enemy
{
    public class LightningAttack : MonoBehaviour
    {
        [SerializeField] private EnemyHealth _enemyHealth;
        [SerializeField] private EnemyMovement _enemyMovement;
        [SerializeField] private LayerMask _enemyMask;
        
        [SerializeField] private ParticleSystem _lightningEffect;
        [SerializeField] private Transform _effectTarget;
        
        private readonly Collider[] _results = new Collider[1];
        private Transform _target;
        private IDamageable _targetHealth;

        [Space]
        
        [SerializeField] private AudioSource _source;
        [SerializeField] private AudioClip _startAttack;
        [SerializeField] private AudioSource _attackLoop;
        [SerializeField] private float _volume;
        [SerializeField] private float _prepareToAttackOffset;

        [Space]
        
        [SerializeField] private float _cooldown;
        [SerializeField] private float _attackTime;
        [SerializeField] private float _attackRadius;
        [SerializeField] private float _startAttackRadius;
        [SerializeField] private float _damagePerTime;
        [SerializeField] private float _timeBetweenAttacks;

        private float _attackTimer;
        private float _cooldownTimer;
        
        private readonly SerialDisposable _serialDisposable = new SerialDisposable();
        private Animator _animator;
        
        private int _attackState;
        private static readonly int Attack1 = Animator.StringToHash("Attack");

        private float _baseSpeed;
        
        private void Start()
        {
            _animator = GetComponentInChildren<Animator>();

            _baseSpeed = _enemyMovement.speed;
            
            _enemyHealth.OnDeath += () =>
            {
                _serialDisposable.Disposable?.Dispose();
                enabled = false;
            };

            Observable.EveryUpdate().Subscribe(x =>
            {
                if (_cooldownTimer > Time.time) return;
                
                int size;
                if (_attackState > 0)
                {
                    if (_attackTimer < Time.time )
                    {
                        _animator.SetBool(Attack1, false);

                        _enemyMovement.speed = _baseSpeed;
                        _attackState = 0;
                        _attackLoop.Stop();
                        _lightningEffect.Stop();
                        _cooldownTimer = Time.time + _cooldown;
                    }
                    
                    if (_attackState == 2 && _target != null)
                    {
                        size = Physics.OverlapSphereNonAlloc(transform.position, _attackRadius, _results, _enemyMask);
                        if (size > 0)
                            _effectTarget.position = _target.position;
                    }
                    
                    return;
                }
            
                size = Physics.OverlapSphereNonAlloc(transform.position, _startAttackRadius, _results, _enemyMask);
                if (size > 0)
                    Attack();
                
            }).AddTo(this);

            Observable.Interval(TimeSpan.FromSeconds(_timeBetweenAttacks)).Subscribe(x =>
            {
                if (_attackState == 2 && _targetHealth != null)
                {
                    var size = Physics.OverlapSphereNonAlloc(transform.position, _attackRadius, _results, _enemyMask);
                    if (size > 0)
                        _targetHealth.TakeDamage(_damagePerTime);
                }
            }).AddTo(this);
            
            _serialDisposable.AddTo(this);
        }
        
        private void Attack()
        {
            _attackState = 1;
            _enemyMovement.speed = 0f;
            
            _target = _results[0].transform;
            _targetHealth = _results[0].GetComponent<IDamageable>();

            _attackTimer = Time.time + _attackTime;
            
            _serialDisposable.Disposable = Observable.NextFrame().Subscribe(c =>
            {
                _animator.SetBool(Attack1, true);

                _serialDisposable.Disposable = Observable.Timer(TimeSpan.FromSeconds(_prepareToAttackOffset)).Subscribe(
                    n =>
                    {
                        _attackLoop.Play();
                        _lightningEffect.Play();
                        _source.PlayOneShot(_startAttack, _volume);
                        _attackState = 2;
                    });
            });
        }
    }
}