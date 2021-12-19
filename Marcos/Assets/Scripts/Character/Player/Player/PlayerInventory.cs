using System.Collections.Generic;
using Character.Player.Interactable;
using Character.Player.PlayerInput;
using Character.Player.Weapon;
using ECM.Components;
using UniRx;
using UnityEngine;

namespace Character.Player.Player
{
    public class PlayerInventory : MonoBehaviour
    {
        [SerializeField] private Interaction _interaction;
        [SerializeField] private InputHandler _inputHandler;
        [SerializeField] private PlayerHealth _playerHealth;
        [SerializeField] private Transform _weaponParent;
        [SerializeField] private Transform _ammoParent;
        [SerializeField] private LayerMask _interactable;
        [SerializeField] private LayerMask _nonInteractable;
        [SerializeField] private Ammo _pistolAmmo;
        [SerializeField] private Weapon.Weapon _pistol;
        
        [Space]
        
        [SerializeField] private BaseGroundDetection _groundDetection;
        [SerializeField] private float _rotationSpeed;

        private readonly List<Weapon.Weapon> _weapons = new List<Weapon.Weapon>();
        private readonly List<Ammo> _ammos = new List<Ammo>();

        private int _currentWeapon;

        public IWeapon CurrentWeapon => _weapons.Count != 0 ? _weapons?[_currentWeapon] : null;
        public int CurrentIndex => _currentWeapon;
        public int WeaponsCount => _weapons.Count;
        
        public delegate void WeaponState(Weapon.Weapon weapon);

        public event WeaponState OnWeaponAdded;
        public event WeaponState OnWeaponChanged;
        public event WeaponState OnWeaponRemoved;
        
        private void AddWeapon(Weapon.Weapon weapon)
        {
            weapon.gameObject.layer = _nonInteractable;

            var t = weapon.transform;
            t.SetParent(_weaponParent, false);
            t.localPosition = weapon.Characteristics.Position;
            t.localRotation = Quaternion.Euler(weapon.Characteristics.Rotation);
            t.localScale = weapon.Characteristics.Scale;
            
            _weapons.Add(weapon);

            for (int i = 0; i < _weapons.Count; i++)
                _weapons[i].gameObject.SetActive(i == _currentWeapon);
            
            
            foreach (var ammo in _ammos)
                if (ammo.AmmoType == weapon.Characteristics.AmmoType)
                    weapon.Ammo = ammo;

            OnWeaponAdded?.Invoke(weapon);
            if (_weapons.Count == 1)
            {
                OnWeaponChanged?.Invoke(weapon);
                weapon.Ammo?.Changed();
            }
        }

        private void AddAmmo(Ammo ammo)
        {
            ammo.gameObject.layer = _nonInteractable;
            ammo.Outlinable.enabled = false;

            var tr = ammo.transform;
            tr.SetParent(_ammoParent, false);
            tr.localPosition = Vector3.zero; 
            tr.localRotation = Quaternion.identity;
            
            _ammos.Add(ammo);
                    
            foreach (var weapon in _weapons)
                if (weapon.Characteristics.AmmoType == ammo.AmmoType) weapon.Ammo = ammo;

            if (_weapons.Count > 0)
            {
                if(_weapons?[_currentWeapon].Ammo != null)
                    _weapons?[_currentWeapon].Ammo.Changed();
                OnWeaponChanged?.Invoke(_weapons?[_currentWeapon]);
            }
        }
        
        private void Start()
        {
            AddAmmo(_pistolAmmo);
            AddWeapon(_pistol);
            
            _interaction.OnInteract += interactable =>
            {
                switch (interactable)
                {
                    case WeaponInteractable weaponInteractable:
                    {
                        AddWeapon(weaponInteractable.Weapon);
                        weaponInteractable.Lowlight();

                        break;
                    }
                    case AmmoInteractable ammoInteractable:
                    {
                        var iAmmo = ammoInteractable.Ammo;
                        foreach (var ammo in _ammos)
                            if (ammo.AmmoType == iAmmo.AmmoType)
                            {
                                var toReduce = ammo.AddAmmo(iAmmo.CurrentAmmoMagazine + iAmmo.CurrentAmmoStock);
                                iAmmo.ReduceAmmo(toReduce);

                                if(iAmmo.CurrentAmmoMagazine + iAmmo.CurrentAmmoStock == 0)
                                    Destroy(ammoInteractable.gameObject);
                                
                                return;
                            }
                        
                        AddAmmo(iAmmo);
                        
                        break;
                    }
                }
            };

            _inputHandler.OnWheelRoll += direction =>
            {
                if (_currentWeapon + direction >= 0 && _currentWeapon + direction < _weapons.Count)
                {
                    _weapons[_currentWeapon].gameObject.SetActive(false);
                    _currentWeapon += direction;
                    
                    OnWeaponChanged?.Invoke(_weapons[_currentWeapon]);
                    _weapons[_currentWeapon].Ammo?.Changed();

                    _weapons[_currentWeapon].gameObject.SetActive(true);
                }
            };
            
            Observable.EveryUpdate().Subscribe(x =>
            {
                if (_weapons.Count == 0) return;
                
                var _transfrom = _weapons[_currentWeapon].transform;
                var forward = transform.forward;
                _transfrom.localRotation = Quaternion.Lerp(_transfrom.localRotation,
                    Quaternion.Euler(_weapons[_currentWeapon].Characteristics.Rotation) *
                    Quaternion.Euler(0, 0,
                        AngleBetween(forward,
                            Vector3.Project(forward, _inputHandler.DiretionToMouse))),
                    _rotationSpeed * Mathf.Deg2Rad * Time.deltaTime);

            }).AddTo(this);

            _inputHandler.OnWeaponHotkey += i =>
            {
                if (i < _weapons.Count)
                {
                    _weapons[_currentWeapon].gameObject.SetActive(false);
                    _currentWeapon = i;
                    
                    OnWeaponChanged?.Invoke(_weapons[_currentWeapon]);
                    _weapons[_currentWeapon].Ammo?.Changed();

                    _weapons[_currentWeapon].gameObject.SetActive(true);
                }
            };
        }
    
        private float AngleBetween(Vector3 a, Vector3 b)
        {
            return Vector3.Angle(a, b) * (a.y < b.y ? 1 : -1); //Mathf.Acos(Vector3.Dot(a, b) / (a.magnitude * b.magnitude)) * Mathf.Rad2Deg;
        }
    }
}