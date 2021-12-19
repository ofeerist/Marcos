using System;
using UniRx;
using UnityEngine;

namespace Character.Player.Weapon.Tracer
{
    [RequireComponent(typeof(LineRenderer))]
    public class AlphaFade : MonoBehaviour
    {
        [SerializeField] private float _fadeSpeed;
        private Color _startColor;
        private LineRenderer _lineRenderer;
        private void Awake()
        {
            if (_lineRenderer == null) _lineRenderer = GetComponent<LineRenderer>();
            _startColor = _lineRenderer.endColor;
            
            Observable.EveryUpdate().Subscribe(x =>
            {
                _lineRenderer.endColor = Color.Lerp(_lineRenderer.endColor, Color.clear, _fadeSpeed * Time.deltaTime);
                _lineRenderer.startColor = _lineRenderer.endColor;
            }).AddTo(this);
        }

        public void Restart()
        {
            _lineRenderer.startColor = _lineRenderer.endColor = _startColor;
        }
    }
}