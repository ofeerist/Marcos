using EPOOutline;
using UnityEngine;

namespace Character.Player.Interactable
{
    public class WeaponInteractable : MonoBehaviour, IInteractable
    {
        [SerializeField] private string Name;
        [SerializeField] private string Description;
        
        [SerializeField] private Weapon.Weapon _weapon;
        public Weapon.Weapon Weapon => _weapon;

        [SerializeField] private AudioSource _audioSource;
        [SerializeField] private AudioClip _interactSound;

        [SerializeField] private Outlinable[] _outlinables;
        
        public string Highlight()
        {
            foreach (var outlinable in _outlinables)
                outlinable.enabled = true;

            return $"{Name}\n{Description}";
        }

        public void Lowlight()
        {
            foreach (var outlinable in _outlinables)
                outlinable.enabled = false;
        }

        public void Interact()
        {   
            if (_audioSource) _audioSource.PlayOneShot(_interactSound);
        }
    }
}