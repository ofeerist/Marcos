using System;
using UniRx;
using UnityEngine;
using Random = UnityEngine.Random;

namespace Misc
{
    public class BackgroundAmbient : MonoBehaviour
    {
        [SerializeField] private AudioClip[] _playlist;
        [SerializeField] private AudioSource _audioSource;

        private readonly SerialDisposable _serialDisposable = new SerialDisposable();
        private void Start()
        {
            _serialDisposable.AddTo(this);

            PlayTrack();
        }

        private void PlayTrack()
        {
            var clip = _playlist[Random.Range(0, _playlist.Length)];
            _audioSource.PlayOneShot(clip);

            _serialDisposable.Disposable = Observable.Timer(TimeSpan.FromSeconds(clip.length)).Subscribe(x =>
            {
                PlayTrack();
            });
        }
    }
}