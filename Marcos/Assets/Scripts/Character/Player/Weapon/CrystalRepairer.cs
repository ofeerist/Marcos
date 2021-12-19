using System;
using UniRx;
using UnityEngine;
using Vector3 = UnityEngine.Vector3;

namespace Character.Player.Weapon
{
    public class CrystalRepairer : Weapon
    {
        [SerializeField] private LayerMask _crystalMask;
        [SerializeField] private LayerMask _enemyMask;
        [SerializeField] private float _coneAngle;
        [SerializeField] private float _radius;
        [SerializeField] private float _interval;
        [SerializeField] private float _crystalHeal;
        [SerializeField] private float _enemyDamage;
        [SerializeField] private ParticleSystem _particleSystem;
        [SerializeField] private AudioSource _flameAudioSource;
        
        private readonly Collider[] _results = new Collider[1];

        private float _timer;
        
        public override bool Shoot()
        {
            _timer = Time.time + .2f;
            return true;
        }

        private void Start()
        {
            Observable.Interval(TimeSpan.FromSeconds(_interval)).Subscribe(x =>
            {
                if (_timer < Time.time)
                {
                    _particleSystem.Stop();
                    _flameAudioSource.Stop();
                    return;
                }
                else
                {
                    _particleSystem.Play();
                    if (!_flameAudioSource.isPlaying) _flameAudioSource.Play();
                }
                
                var size = Physics.OverlapSphereNonAlloc(transform.position, _radius, _results, _crystalMask);
                if (size > 0 && CheckCone(_results[0].transform.position))
                    _results[0].GetComponent<CrystalHP>().AddHP(_crystalHeal);
                
                size = Physics.OverlapSphereNonAlloc(transform.position, _radius, _results, _enemyMask);
                if (size > 0 && CheckCone(_results[0].transform.position))
                    _results[0].GetComponent<IDamageable>().TakeDamage(_enemyDamage);
            }).AddTo(this);
        }

        private bool CheckCone(Vector3 position)
        {
            var transform1 = transform;
            return Vector3.Dot(position - transform1.position, transform1.forward) < Mathf.Cos(_coneAngle);
        }
    }
}