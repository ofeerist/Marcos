using System;
using UniRx;
using UnityEngine;

namespace Character.Player.PlayerInput
{
    public class InputHandler : MonoBehaviour
    {
        [SerializeField] private Transform _transform;
        [SerializeField] private Transform _camera;
        [SerializeField] private Transform _cursor;
        [SerializeField] private float _cursorSpeed;
        [SerializeField] private float _cursorAngularSpeed;
        [SerializeField] private LayerMask _terrain;
        [SerializeField] private GameObject _pauseManager;

        public Camera MainCamera => _mainCamera;
        [SerializeField] private Camera _mainCamera;
        
        public Vector3 MousePosition { get; private set; }

        public Vector3 DiretionToMouse => MousePosition - _transform.position;

        public delegate void KeyEvent();
        public delegate void KeyBoolEvent(ref bool state);
        public delegate void WheelEvent(int direction);
        
        public event KeyEvent OnShoot;
        public event KeyEvent ShootHold;
        private bool interactHold;

        public event KeyEvent OnReload;
        
        public event WheelEvent OnWheelRoll;
        public event Action<int> OnWeaponHotkey;
        
        public event KeyEvent CameraRightRotate;
        public event KeyEvent CameraLeftRotate;
        
        public event KeyBoolEvent Interact;
        
        private readonly RaycastHit[] _hits = new RaycastHit[2];

        public event KeyEvent OnScopeStart;
        public event KeyEvent OnScopeEnd;

        private readonly KeyCode[] weaponHotkeys =
        {
            KeyCode.Alpha1, KeyCode.Alpha2, KeyCode.Alpha3, KeyCode.Alpha4, KeyCode.Alpha5, KeyCode.Alpha6,
            KeyCode.Alpha7, KeyCode.Alpha8, KeyCode.Alpha9, KeyCode.Alpha0
        };

        public void StopGame()
        {
            Time.timeScale = 0;
            Cursor.visible = true;
        }
        
        public void ContinueGame()
        {
            Time.timeScale = 1;
        }
        
        private void Start()
        {
            Observable.EveryUpdate().Subscribe(x =>
            {
                if (Time.timeScale == 0) return;
                
                var ray = _mainCamera.ScreenPointToRay(Input.mousePosition);
                if (Physics.Raycast(ray, out var hit, Mathf.Infinity, _terrain))
                {
                    _cursor.position = Vector3.Lerp(_cursor.position, hit.point, _cursorSpeed * Time.deltaTime);
                    MousePosition = hit.point;
                    _cursor.up = Vector3.Lerp(_cursor.up, hit.normal, _cursorAngularSpeed * Mathf.Deg2Rad * Time.deltaTime);
                    _cursor.rotation *= Quaternion.AngleAxis(_camera.eulerAngles.y, Vector3.up);
                    
                    var count = Physics.RaycastNonAlloc(ray, _hits);
                    Cursor.visible = !_pauseManager.activeSelf || (count > 1 && (int)Mathf.Pow(2, _hits[1].collider.gameObject.layer) != _terrain.value);
                }
                else
                {
                    Cursor.visible = !_pauseManager.activeSelf;
                }
                
                if(Input.GetMouseButtonDown(0))
                {
                    bool b = false;
                    Interact?.Invoke(ref b);
                    interactHold = b;
                }
                else if(Input.GetMouseButtonUp(0)) {
                    interactHold = false;
                }
                if (!interactHold)
                {
                    if (Input.GetMouseButtonDown(0)) OnShoot?.Invoke();
                    if (Input.GetMouseButton(0)) ShootHold?.Invoke();
                }

                if (Input.mouseScrollDelta.y != 0) OnWheelRoll?.Invoke((int)Mathf.Sign(Input.mouseScrollDelta.y));
                
                if(Input.GetKeyDown(KeyCode.Z)) CameraLeftRotate?.Invoke();
                else if(Input.GetKeyDown(KeyCode.X)) CameraRightRotate?.Invoke();

                if (Input.GetKeyDown(KeyCode.R)) OnReload?.Invoke();
                
                if (Input.GetMouseButtonDown(1)) OnScopeStart?.Invoke();
                if (Input.GetMouseButtonUp(1)) OnScopeEnd?.Invoke();


                for (int i = 0; i < weaponHotkeys.Length; i++)
                    if (Input.GetKeyDown(weaponHotkeys[i]))
                        OnWeaponHotkey?.Invoke(i);
                
            }).AddTo(this);
        }

        public Vector3 GetMoveDirection()
        {
            //return _transform.right * Input.GetAxisRaw("Horizontal") +
            //       _transform.forward * Input.GetAxisRaw("Vertical");

            return Vector3.ProjectOnPlane(_camera.right, Vector3.up).normalized * Input.GetAxisRaw("Horizontal") +
                   Vector3.ProjectOnPlane(_camera.forward, Vector3.up).normalized * Input.GetAxisRaw("Vertical");
        }
    }
}