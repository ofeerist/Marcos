using System;
using ECM.Controllers;
using UniRx;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.UI;

namespace Character.Enemy
{
    public class EnemyMovement : BaseAgentController
    {
        [Header("Input")] 
        
        [SerializeField] private LayerMask _enemyLayer;
        [SerializeField] private float _findingDistance;
        [SerializeField] private LayerMask _crystalLayer;
        [SerializeField] private float _crystalFindingDistance;
        [SerializeField] private EnemyHealth _health;

        private readonly Collider[] _results = new Collider[1];
        private readonly Collider[] _crystalResults = new Collider[3];
        
        private Animator _animator;
        private static readonly int Speed = Animator.StringToHash("Speed");
        
        private void Start()
        {
            _animator = GetComponentInChildren<Animator>();

            _health.OnDeath += () =>
            {
                speed = 0;
            };
        }

        protected override void HandleInput()
        {
            var size = Physics.OverlapSphereNonAlloc(transform.position, _findingDistance, _results, _enemyLayer);
            if (size > 0)
                agent.SetDestination(_results[0].transform.position);
            else
            {
                size = Physics.OverlapSphereNonAlloc(transform.position, _crystalFindingDistance, _crystalResults, _crystalLayer);
                if (size > 0)
                {
                    var min = Mathf.Infinity;
                    var mR = transform.position;
                    for (int i = 0; i < size; i++)
                    {
                        var distance = Vector3.Distance(transform.position, _crystalResults[i].transform.position);
                        if (distance < min)
                        {
                            min = distance;
                            mR = _crystalResults[i].transform.position;
                        }
                    }
                    agent.SetDestination(mR);
                }
            }
        }

        protected override void Animate()
        {
            _animator.SetFloat(Speed, agent.velocity.magnitude);
        }

        private void OnDrawGizmosSelected()
        {
            Gizmos.color = Color.green;
            Gizmos.DrawWireSphere(transform.position, _findingDistance);
        }
    }
}