using System;
using System.Collections.Generic;
using Character.Player.Weapon.Obstacle;
using EPOOutline;
using Misc;
using UniRx;
using Unity.Mathematics;
using UnityEngine;
using Random = UnityEngine.Random;

namespace Character.Player.Weapon
{
    [Serializable]
    public class TimedSound
    {
        public AudioClip audioClip;
        public float duration;
        public float volume;
    }
    public class Weapon : MonoBehaviour, IWeapon
    {
        public IAmmo Ammo;

        public WeaponCharacteristics Characteristics;
        
        [SerializeField] private Transform _rightIKTransform;
        public Transform RightIKTransform => _rightIKTransform;
        
        [SerializeField] private Transform _leftIKTransform;
        public Transform LeftIKTransform => _leftIKTransform;

        [SerializeField] private ParticleSystem _flashBang;
        [SerializeField] private Tracer.Tracer _tracer;
        private Pool<Tracer.Tracer> _tracers;

        [SerializeField] private TimedSound[] _shootSounds;
        [SerializeField] private Transform[] _shootSources;

        public event IWeapon.OnShoot BeforeShoot;

        [SerializeField] private bool _autoAttack;
        [SerializeField] private float _cooldownBetweenShots;

        private Quaternion _standartRotation;

        [SerializeField] private float _timeToResetSpray;
        private float _sprayTime;
        private float _sprayTimer;
        private float _firstSprayShootTime;
        
        [SerializeField] private AnimationCurve _bulletVerticalDistortionByTime;
        [SerializeField] private AnimationCurve _bulletHorizontalDistortionByTime;

        [SerializeField] private int _maxPenetrationTimes;
        [SerializeField] private float _bulletEnergy;
        [SerializeField] private float _damage;
        
        private RaycastHit _raycastHit;

        [SerializeField] private AudioSource _audioSource;
        [SerializeField] private TimedSound[] _reloadSounds;
        private bool _reloadState;
        
        private readonly SerialDisposable _reloadDisposable = new SerialDisposable();

        private readonly Queue<SerialDisposable> _shootDisposables = new Queue<SerialDisposable>();
        
        private void Start()
        {
            _standartRotation = _shootSources[0].localRotation;

            _tracers = new Pool<Tracer.Tracer>(_tracer, (Mathf.RoundToInt(1 / _cooldownBetweenShots) + 1) * _shootSources.Length);

            for (int i = 0; i < 5; i++)
                _shootDisposables.Enqueue(new SerialDisposable().AddTo(this));


            _reloadDisposable.AddTo(this);
        }

        private bool Reflect(ref Vector3 position, ref Vector3 direction, ref float bulletEnergy, BulletObstacle obstacle, List<Vector3> positions)
        {
            if (bulletEnergy >= obstacle.MinimumBulletEnergyToReflect && Vector3.Angle(_raycastHit.normal, direction) - 90 < obstacle.MaximumAngleToReflect)
            {
                position = _raycastHit.point;
                direction = Vector3.Reflect(direction, _raycastHit.normal);
                            
                bulletEnergy -= obstacle.BulletEnergyLossByReflect;
                positions.Add(position);

                return true;
            }

            return false;
        }

        public WeaponCharacteristics GetCharacteristics()
        {
            return Characteristics;
        }

        public void Reload()
        {
            if (_reloadState || Ammo == null || Ammo.IsMagazineFull()) return;

            _reloadState = true;
            ReloadSound(0);
        }

        public void StopReload()
        {
            if (_reloadState)
            {
                _reloadDisposable.Disposable.Dispose();
                _reloadState = false;
            }
        }

        private void ReloadSound(int index)
        {
            if (_reloadSounds.Length <= index)
            {
                Ammo.Reload();
                _reloadState = false;
                
                return;
            }
            
            _audioSource.PlayOneShot(_reloadSounds[index].audioClip, _reloadSounds[index].volume);
            _reloadDisposable.Disposable = Observable.Timer(TimeSpan.FromSeconds(_reloadSounds[index].duration)).Subscribe(x =>
            {
                ReloadSound(index + 1);
            });
        }

        private void ShootSound(int index, SerialDisposable _serialDisposable)
        {
            if (_shootSounds.Length <= index)
            {
                _shootDisposables.Enqueue(_serialDisposable);
                return;
            }

            _audioSource.PlayOneShot(_shootSounds[index].audioClip, _shootSounds[index].volume);
            _serialDisposable.Disposable = Observable.Timer(TimeSpan.FromSeconds(_shootSounds[index].duration)).Subscribe(x =>
            {
                ShootSound(index + 1, _serialDisposable);
            });
        }

        private readonly List<IDamageable> _damageables = new List<IDamageable>();
        
        public virtual bool Shoot()
        {
            if (_reloadState) return false;
            
            BeforeShoot?.Invoke();
            
            if (Ammo != null && Ammo.SpendAmmo(Characteristics.AmmoConsumption))
            {
                _flashBang.Play();

                if (_shootSounds.Length > 0)
                    ShootSound(0, _shootDisposables.Dequeue());

                foreach (var t in _shootSources)
                {
                    // Distortion
                    var vDistr = _bulletVerticalDistortionByTime.Evaluate(_sprayTime);
                    var hDistr = _bulletHorizontalDistortionByTime.Evaluate(_sprayTime);

                    t.localRotation = _standartRotation *
                                      Quaternion.AngleAxis(Random.Range(-vDistr, vDistr),
                                          Vector3.right) *
                                      Quaternion.AngleAxis(Random.Range(-hDistr, hDistr),
                                          Vector3.up);

                    var bulletEnergy = _bulletEnergy;
                    var penetrationTimes = 0;

                    var currentPosition = t.position;
                    var currentDirection = t.TransformDirection(Vector3.forward); //direction.y = 0;
                    
                    var positions = new List<Vector3> { t.position };
                        
                    var loopMax = 30;
                    while (penetrationTimes < _maxPenetrationTimes && bulletEnergy > 0 && loopMax-- > 0)
                    {
                        // input hole
                        if (Physics.Raycast(currentPosition, currentDirection,
                            out _raycastHit, Mathf.Infinity))
                        {
                            var obstacle = _raycastHit.collider.GetComponent<BulletObstacle>();
                            if (obstacle == null) break;

                            obstacle.CreateImpact(_raycastHit.point, _raycastHit.normal);

                            if (Reflect(ref currentPosition, ref currentDirection, ref bulletEnergy, obstacle,
                                positions)) continue;

                            var prevPos = _raycastHit.point;
                            var reversePos = currentPosition + currentDirection * _raycastHit.distance *
                                _raycastHit.collider.bounds.max.magnitude;

                            if (obstacle.TryGetComponent<IDamageable>(out var damageable) && !_damageables.Contains(damageable))
                            {
                                Damage(damageable, bulletEnergy);
                                _damageables.Add(damageable);
                            }
                            
                            // output hole
                            if (_raycastHit.collider.Raycast(
                                new Ray(reversePos, -currentDirection),
                                out _raycastHit, Mathf.Infinity))
                            {
                                currentPosition = _raycastHit.point;
                                obstacle.CreateImpact(_raycastHit.point, _raycastHit.normal);
                                positions.Add(currentPosition);

                                bulletEnergy -= obstacle.BulletEnergyLossPerUnit *
                                                Vector3.Distance(prevPos, _raycastHit.point);
                                penetrationTimes += 1;

                                continue;
                            }
                        }

                        break;
                    }
                
                    positions.Add(currentPosition + currentDirection * 50);
                    if (_tracers.TryInstantiate(out var instantiateEntity, transform.position, quaternion.identity))
                        instantiateEntity.SetPositions(positions.ToArray());
                    _damageables.Clear();
                }

                if (_sprayTimer > Time.time)
                {
                    _sprayTime = Time.time - _firstSprayShootTime;
                }
                else
                {
                    _sprayTime = 0f;
                    _firstSprayShootTime = Time.time;
                }
                
                _sprayTimer = Time.time + _timeToResetSpray;
            }
            else
            {
                //add Sound
                _audioSource.Play();

                return false;
            }

            return true;
        }

        private void Damage(IDamageable damageable, float bulletEnergy)
        {
            var damage = _damage * (bulletEnergy / _bulletEnergy);
            damageable.TakeDamage(damage);
        }

        public float GetCooldown()
        {
            return _cooldownBetweenShots;
        }

        public bool AutoAttack()
        {
            return _autoAttack;
        }

        private void OnDrawGizmos()
        {
            //Gizmos.DrawRay(_shootSources[0].position, _shootSources[0].TransformDirection(Vector3.forward) * 10);
        }
    }
}