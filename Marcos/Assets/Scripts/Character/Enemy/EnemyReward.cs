using System;
using Character.Player.Interactable;
using UnityEngine;
using UnityEngine.AI;
using Random = UnityEngine.Random;

namespace Character.Enemy
{
    [Serializable]
    public class Reward
    {
        public InteractableClipAnimator InteractableClipAnimator;
        public float Chance;
    }
    public class EnemyReward : MonoBehaviour
    {
        [SerializeField] private EnemyHealth _enemyHealth;
        [SerializeField] private float _rewardDistanceDrop;
        [SerializeField] private Reward[] _rewards;

        private void Start()
        {
            _enemyHealth.OnDeath += () =>
            {
                foreach (var reward in _rewards)
                {
                    if (Random.Range(0f, 100f) <= reward.Chance)
                    {
                        var position = Vector3.positiveInfinity;
                        while(float.IsInfinity(position.x)) position = GetRandomPoint(transform.position, _rewardDistanceDrop);

                        var p = Instantiate(
                            reward.InteractableClipAnimator, position,
                            Quaternion.identity);
                        
                        p.Animation();
                    }
                }
            };
        }
        
        private static Vector3 GetRandomPoint(Vector3 center, float maxDistance) {
            var randomPos = Random.insideUnitSphere * maxDistance + center;
            NavMesh.SamplePosition(randomPos, out var hit, maxDistance, NavMesh.AllAreas);

            return hit.position;
        }

        private void OnDrawGizmosSelected()
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(transform.position, _rewardDistanceDrop);
        }
    }
}