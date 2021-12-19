using System;
using Misc;
using UniRx;
using UnityEngine;
using Random = UnityEngine.Random;

namespace Character.Enemy
{
    [Serializable]
    public class FactoryUnit
    {
        public Pool<EnemyHealth> Pool;
        public EnemyHealth Prefab;
        public float MinimumTime;

        public void Init(Transform transform)
        {
            Pool = new Pool<EnemyHealth>(Prefab, 32, transform);
        }
    }
    public class EnemyFactory : MonoBehaviour
    {
        [SerializeField] private Transform _enemyTransform;
        [SerializeField] private AnimationCurve _spawnTimeCurve;
        [SerializeField] private AnimationCurve _spawnCountCurve;
        [SerializeField] private Transform[] _spawnPositions;
        [SerializeField] private FactoryUnit[] _enemyPrefab;

        private float _curveValue;
        private float _lastTime;

        private Pool<EnemyHealth>[] _enemyPools;
        private void Start()
        {
            foreach (var t in _enemyPrefab)
                t.Init(_enemyTransform);
            
            Observable.EveryUpdate().Subscribe(x =>
            {
                var spawnTime = _spawnTimeCurve.Evaluate(_curveValue);
                var spawnCount = _spawnCountCurve.Evaluate(_curveValue);

                if (_lastTime + spawnTime < Time.time) 
                {
                    for (int i = 0; i < spawnCount; i++)
                    
                        foreach (var t in _enemyPrefab)
                            if (_curveValue >= t.MinimumTime)
                            {
                                if (t.Pool.TryInstantiate(out var enemy,
                                    _spawnPositions[Random.Range(0, _spawnPositions.Length)].position,
                                    Quaternion.identity))
                                {
                                    enemy.Init();
                                    enemy.Revive();
                                }
                            }


                    _lastTime = Time.time;
                }

                _curveValue += Time.deltaTime;
            }).AddTo(this);
        }
    }
}