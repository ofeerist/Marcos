using UnityEngine;

namespace Misc
{
    public class RandomClip : MonoBehaviour
    {
        [SerializeField] private AudioClip[] _clips;
        [SerializeField] private AudioSource _source;

        private void Awake()
        { 
            _source.PlayOneShot(_clips[Random.Range(0, _clips.Length)]);
        }
    }
}