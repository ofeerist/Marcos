using UnityEngine;
using Random = UnityEngine.Random;

namespace Character
{
    public class StepSound : MonoBehaviour
    {
        [SerializeField] private AudioSource _audioSource;
        [SerializeField] private AudioClip[] _clips;
        [SerializeField] private float _volume;
        
        private void Play()
        { 
            _audioSource.PlayOneShot(_clips[Random.Range(0, _clips.Length)], _volume);
        }
    }
}