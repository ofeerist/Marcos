using EPOOutline;
using MirzaBeig.ParticleSystems;
using UnityEngine;

namespace Character.Player.Interactable
{
    public class HPInteractable : MonoBehaviour, IInteractable
    {
        [SerializeField] private string Name;
        [SerializeField] private string Description;
        
        [SerializeField] private float _hpRestore;
        public float HPRestore => _hpRestore;
        
        [SerializeField] private Outlinable _outlinable;
        
        [SerializeField] private AudioSource _audioSource;
        [SerializeField] private AudioClip _interactSound;

        public string Highlight()
        {
            _outlinable.enabled = true;

            return $"{Name}\n{Description}";
        }

        public void Lowlight()
        {
            if(_outlinable)
                _outlinable.enabled = false;
        }

        public void Interact()
        {
            Destroy(gameObject);
        }
    }
}