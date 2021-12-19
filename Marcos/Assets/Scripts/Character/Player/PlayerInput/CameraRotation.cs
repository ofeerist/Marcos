using UniRx;
using UnityEngine;

namespace Character.Player.PlayerInput
{
    public class CameraRotation : MonoBehaviour
    {
        [SerializeField] private InputHandler _inputHandler;
        [SerializeField] private Transform _camera;
        
        [Space]
        
        [SerializeField] private float _rotationStep;
        [SerializeField] private float _rotationSpeed;
        [SerializeField] private float _rotationCooldown;
        private float _cooldownTime;
      
     
        private Quaternion _currentRotation;
        private void Start()
        {
            _currentRotation = _camera.rotation;
        
            _inputHandler.CameraLeftRotate += () => CameraRotate(-1);
            _inputHandler.CameraRightRotate += () => CameraRotate(1);

            Observable.EveryUpdate().Subscribe(x =>
            {
                _camera.rotation = Quaternion.Lerp(_camera.rotation, _currentRotation, _rotationSpeed * Time.deltaTime);
            }).AddTo(this);
        }

        private void CameraRotate(int direction)
        {
            if (_cooldownTime > Time.time) return;

            _cooldownTime = Time.time + _rotationCooldown;

            var eulerAngles = _camera.eulerAngles;
            _currentRotation = Quaternion.Euler(eulerAngles.x, eulerAngles.y + _rotationStep * direction, eulerAngles.z);
        }
    }
}