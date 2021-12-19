using System;
using UniRx;
using UnityEngine;
using Random = UnityEngine.Random;

namespace Character.Enemy
{
    public class PlagueDamager : MonoBehaviour
    {
        [SerializeField] private AudioSource _audioSource;
        [SerializeField] private AudioClip[] _deathClips;
        [SerializeField] private AudioSource _rotAudioSource;
        [SerializeField] private float _volume;
        [SerializeField] private LayerMask _smellLayer;
        [SerializeField] private LayerMask _explosionLayer;
        private readonly Collider[] _results = new Collider[1];
        
        [SerializeField] private ParticleSystem _smell;
        [SerializeField] private ParticleSystem _explosion;
        [SerializeField] private EnemyHealth _enemyHealth;

        [Space] 
        
        [SerializeField] private float _intervalBetweenDamage;
        [SerializeField] private float _smellDamage;
        [SerializeField] private float _smellRadius;
        
        [Space]
        
        [SerializeField] private float _explosionRadius;
        [SerializeField] private float _explosionDamage;

        private void Start()
        {
            var _transform = transform;
            _enemyHealth.OnDeath += () =>
            {
                _rotAudioSource.enabled = false;

                _audioSource.PlayOneShot(_deathClips[Random.Range(0, _deathClips.Length)], _volume);
                _smell.Stop();

                if (_explosion)
                {

                    var ex = Instantiate(_explosion, _explosion.transform.position, Quaternion.identity);
                    ex.gameObject.SetActive(true);
                    ex.Play();

                    var size = Physics.OverlapSphereNonAlloc(_transform.position, _explosionRadius, _results,
                        _explosionLayer);
                    if (size != 0) _results[0].GetComponent<IDamageable>().TakeDamage(_explosionDamage);
                }
                

                enabled = false;
            };

            _enemyHealth.OnRevive += () =>
            {
                _rotAudioSource.enabled = true;
                _rotAudioSource.Play();
            };
            
            Observable.Interval(TimeSpan.FromSeconds(_intervalBetweenDamage)).Subscribe(x =>
            {
                if (!isActiveAndEnabled) return;
                
                var size = Physics.OverlapSphereNonAlloc(_transform.position, _smellRadius, _results, _smellLayer);
                if (size != 0) _results[0].GetComponent<IDamageable>().TakeDamage(_smellDamage);
            }).AddTo(this);
        }

        private void OnDrawGizmosSelected()
        {
            var position = transform.position;
            
            Gizmos.color = Color.yellow;   
            Gizmos.DrawWireSphere(position, _smellRadius);
            
            Gizmos.color = Color.magenta;
            Gizmos.DrawWireSphere(position, _explosionRadius);
        }
    }
}