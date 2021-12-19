using Character.Player.Player;
using Character.Player.PlayerInput;
using Character.Player.Weapon;
using ECM.Controllers;
using UnityEngine;

namespace Character.Player
{
    public class PlayerMovement : BaseCharacterController
    {
        [Space] [Header("Additional")]
        [SerializeField] private InputHandler _inputHandler;

        [SerializeField] private Transform _bottom;
        [SerializeField] private float _bottomAngularSpeed;
        [SerializeField] private PlayerInventory _playerInventory;
        
        private static readonly int Speed = Animator.StringToHash("Speed");

        private Animator[] _animators;
        
        private WeaponCharacteristics currentWeapon;
       private void Start()
       {
           _animators = GetComponentsInChildren<Animator>();

           var baseSpeed = speed;

           _playerInventory.OnWeaponChanged += weapon =>
           {
               currentWeapon = weapon.GetCharacteristics();
               speed = baseSpeed * currentWeapon.MovementSpeedPercent;
           };

           _inputHandler.OnScopeStart += () =>
           {
               if (currentWeapon == null) return;
               
               speed = baseSpeed * currentWeapon.ScopeMovementSpeedPercent;
           };
           
           _inputHandler.OnScopeEnd += () =>
           {
               if (currentWeapon == null) return;
               
               speed = baseSpeed * currentWeapon.MovementSpeedPercent;
           };
       }

       protected override void HandleInput()
        {
           moveDirection = _inputHandler.GetMoveDirection();
        }

        private void UpdateBottomRotation()
        {
            var velocity = movement.velocity; velocity.y = 0;
            var direction = velocity != Vector3.zero ? velocity : _inputHandler.DiretionToMouse;
            direction.y = 0;
            var targetRotation =
                Quaternion.LookRotation(direction, Vector3.up);

            _bottom.rotation = Quaternion.Slerp(_bottom.rotation, targetRotation,
                _bottomAngularSpeed * Mathf.Deg2Rad * Time.deltaTime);
        }
        
        private void UpdateTopRotation()
        {
            RotateTowards(_inputHandler.DiretionToMouse);
        }
        
        protected override void UpdateRotation()
        {
            UpdateBottomRotation();
            UpdateTopRotation();
        }

        protected override void Animate()
        {
            foreach (var an in _animators)
            {
                an.SetFloat(Speed, movement.velocity.magnitude);   
            }
        }
    }
}