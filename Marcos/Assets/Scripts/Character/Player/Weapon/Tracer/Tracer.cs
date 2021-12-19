using System;
using Misc;
using UniRx;
using UnityEngine;

namespace Character.Player.Weapon.Tracer
{
    [RequireComponent(typeof(LineRenderer))]
    [RequireComponent(typeof(AlphaFade))]
    public class Tracer : PooledItem
    {
        [SerializeField] private float _lifeTime;
        private LineRenderer _line;
        private AlphaFade _alphaFade;
        private void Awake()
        {
            _line = GetComponent<LineRenderer>();
            _alphaFade = GetComponent<AlphaFade>();
            
            Observable.Interval(TimeSpan.FromSeconds(_lifeTime)).Subscribe(x =>
            {
                ReturnToPool();
            });
        }

        public void SetPositions(Vector3[] positions)
        {
            if (positions == null) return;

            _line.positionCount = positions.Length;
            _line.SetPositions(positions);
            
            _alphaFade.Restart();
        }
    }
}