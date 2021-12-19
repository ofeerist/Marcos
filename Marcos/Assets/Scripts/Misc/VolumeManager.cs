using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

namespace Misc
{
    public class VolumeManager : MonoBehaviour
    {
        public Volume volume;
 
        private Bloom bloom;
        private MotionBlur motionBlur;
        
        void Start()
        {
            volume.profile.TryGet(out bloom);
            volume.profile.TryGet(out motionBlur);
        }
 
        public void EnableBloom(bool enabled)
        {
            bloom.active = enabled;
        }
        public void EnableMotionBlur(bool enabled)
        {
            motionBlur.active = enabled;
        }
    }
}