using System;
using UniRx;
using UnityEngine;
using UnityEngine.AI;
using Random = UnityEngine.Random;

namespace Character.Player.Player
{
    public class FallTeleport : MonoBehaviour
    {
        [SerializeField] private float _damageByFall;
        [SerializeField] private float _maxDistanceToTeleport;
        [SerializeField] private PlayerHealth _playerHealth;
        [SerializeField] private float _minimumHeight;
        private void Start()
        {
            var healthTransform = _playerHealth.transform;

            Observable.EveryUpdate().Subscribe(x =>
            {
                if (healthTransform.position.y < _minimumHeight)
                {
                    _playerHealth.TakeDamage(_damageByFall);
                    var position = Vector3.positiveInfinity;
                    while(float.IsInfinity(position.x)) position = GetRandomPoint(healthTransform.position, _maxDistanceToTeleport);
                    
                    healthTransform.position = position;
                }
            }).AddTo(this);
        }

        private static Vector3 GetRandomPoint(Vector3 center, float maxDistance) {
            var randomPos = Random.insideUnitSphere * maxDistance + center;
            NavMesh.SamplePosition(randomPos, out var hit, maxDistance, NavMesh.AllAreas);

            return hit.position;
        }
    }
}