using Character.Player.Player;
using Cinemachine;
using UniRx;
using UnityEngine;

namespace Character.Player.PlayerInput
{
    public class CameraScope : MonoBehaviour
    {
        [SerializeField] private InputHandler _inputHandler;
        [SerializeField] private PlayerInventory _playerInventory;
        [SerializeField] private Transform _aim;
        [SerializeField] private Transform _character;
        
        private bool _inScope;
        private float _distance;
        public bool Hold { get; set; }
        private bool _hold;
        
        [Space]
        
        [SerializeField] private CinemachineVirtualCamera _virtualCamera;
        private CinemachineFramingTransposer _framingTransposer;
        [SerializeField] private Vector3 _damping;
        [SerializeField] private Vector3 _offset;
        [SerializeField] private float _cameraDistance;

        private Vector3 baseDamping;
        private Vector3 baseOffset;
        private float baseCameraDistance;
        
        private void Start()
        {
            var componentBase = _virtualCamera.GetCinemachineComponent(CinemachineCore.Stage.Body);
            if (componentBase is CinemachineFramingTransposer framingTransposer)
            {
                _framingTransposer = framingTransposer;
                
                baseDamping = new Vector3(_framingTransposer.m_XDamping,
                    _framingTransposer.m_YDamping, _framingTransposer.m_ZDamping);
                baseOffset = _framingTransposer.m_TrackedObjectOffset;
                baseCameraDistance = _framingTransposer.m_CameraDistance;
                
                _inputHandler.OnScopeStart += () =>
                {
                    if (Hold)
                    {
                        _hold = !_hold;
                        Scope(_hold);
                    }
                    else Scope(true);
                };
            
                _inputHandler.OnScopeEnd += () =>
                {
                    if (!Hold)
                    {
                        Scope(false);
                    }
                };
            }
            

            Observable.EveryUpdate().Subscribe(x =>
            {
                if (_inScope)
                {
                    if (Vector3.Distance(_character.position, _inputHandler.MousePosition) < _distance)
                    {
                        _aim.position = _inputHandler.MousePosition;
                    }
                    else
                    {
                        var position = _character.position;
                        _aim.position = position + (_inputHandler.MousePosition - position).normalized * _distance;
                    }
                    
                }
                else
                {
                    _aim.position = _character.position;
                }
            }).AddTo(this);
        }

        private void Scope(bool state)
        {
            if (state)
            {
                _inScope = true;
                _distance = _playerInventory.CurrentWeapon.GetCharacteristics().MaxScope;

                _framingTransposer.m_TrackedObjectOffset = _offset;
                _framingTransposer.m_XDamping = _damping.x;
                _framingTransposer.m_YDamping = _damping.y;
                _framingTransposer.m_ZDamping = _damping.z;
                _framingTransposer.m_CameraDistance = _cameraDistance;
            }
            else
            {
                _inScope = false;
                
                _framingTransposer.m_TrackedObjectOffset = baseOffset;
                _framingTransposer.m_XDamping = baseDamping.x;
                _framingTransposer.m_YDamping = baseDamping.y;
                _framingTransposer.m_ZDamping = baseDamping.z;
                _framingTransposer.m_CameraDistance = baseCameraDistance;
            }
        }
    }
}