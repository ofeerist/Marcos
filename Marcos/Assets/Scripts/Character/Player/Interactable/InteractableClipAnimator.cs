using System;
using System.Collections;
using AmazingAssets.AdvancedDissolve;
using UniRx;
using UnityEngine;

namespace Character.Player.Interactable
{
    public class InteractableClipAnimator : MonoBehaviour
    {
        [SerializeField] private Renderer[] _renderers;
        [SerializeField] private float _rendererSpeed;
        [SerializeField] private bool _playOnAwake;

        private void Start()
        {
            if (_playOnAwake) Animation();
        }

        public void Animation()
        {
            Observable.FromMicroCoroutine(Anim).Subscribe(x =>
            {
                Destroy(this);
            }).AddTo(this);
        }

        private IEnumerator Anim()
        {
            var clip = 1f;
            
            while (true)
            {
                foreach (var renderer1 in _renderers)
                {
                    AdvancedDissolveProperties.Cutout.Standard.UpdateLocalProperty(renderer1.material,
                        AdvancedDissolveProperties.Cutout.Standard.Property.Clip, clip);
                }
                
                clip -= _rendererSpeed * Time.deltaTime;

                if (clip <= 0)
                {
                    break;
                }
                
                yield return null;
            }
            
            foreach (var renderer1 in _renderers)
            {
                AdvancedDissolveProperties.Cutout.Standard.UpdateLocalProperty(renderer1.material,
                    AdvancedDissolveProperties.Cutout.Standard.Property.Clip, 0f);
            }
        }
    }
}