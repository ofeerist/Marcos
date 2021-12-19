using System;
using Character.Player.Player;
using Character.Player.PlayerInput;
using Character.Player.Weapon;
using UnityEngine;

namespace Character.Player
{
    public class PlayerShoot : MonoBehaviour
    {
        [SerializeField] private InputHandler _inputHandler;
        [SerializeField] private PlayerInventory _playerInventory;
        [SerializeField] private Animator _animator;
        private static readonly int Shoot = Animator.StringToHash("Shoot");

        private float _shootCooldown;
        
        private void Start()
        {
            _inputHandler.OnShoot += InputHandlerOnOnShoot;
            _inputHandler.ShootHold += InputHandlerOnShootHold;
            _inputHandler.OnReload += InputHandlerOnOnReload;
            _playerInventory.OnWeaponChanged += weapon => { weapon.StopReload(); };
        }

        private void InputHandlerOnOnReload()
        {
            _playerInventory.CurrentWeapon?.Reload();
        }

        private void InputHandlerOnShootHold()
        {
            if (_playerInventory.CurrentWeapon == null) return;
            
            if (!_playerInventory.CurrentWeapon.AutoAttack() || _shootCooldown > Time.time) return;

            InputHandlerOnOnShoot();
        }

        private void InputHandlerOnOnShoot()
        {
            if (_shootCooldown > Time.time) return;

            if (_playerInventory.CurrentWeapon == null) return;

            if (!_playerInventory.CurrentWeapon.Shoot()) return;
            _animator.SetTrigger(Shoot);

            _shootCooldown = Time.time + _playerInventory.CurrentWeapon.GetCooldown();
        }
    }
}