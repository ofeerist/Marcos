using Character.Player.Weapon;
using UnityEngine;

namespace Character.Player.Interactable
{
    public class AmmoInteractable : MonoBehaviour, IInteractable
    {
        [SerializeField] private string Name;
        [SerializeField] private string Description;
        
        [SerializeField] private Ammo _ammo;
        public Ammo Ammo => _ammo;
        
        [SerializeField] private AudioSource _audioSource;
        [SerializeField] private AudioClip _interactSound;

        public string Highlight()
        {
            _ammo.Outlinable.enabled = true;

            return $"{Name}\n{Description}";
        }

        public void Lowlight()
        {
            if(_ammo.Outlinable)
                _ammo.Outlinable.enabled = false;
        }

        public void Interact()
        {
            if (_audioSource) _audioSource.PlayOneShot(_interactSound);
        }
    }
}