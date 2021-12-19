using System;
using EPOOutline;
using UnityEditor;
using UnityEngine;
using Random = UnityEngine.Random;

namespace Character.Player.Weapon
{
    public class Ammo : MonoBehaviour, IAmmo
    {
        [SerializeField] private AmmoTypes _ammoType;
        public AmmoTypes AmmoType => _ammoType;
        
        [SerializeField] private Outlinable _outlinable;
        public Outlinable Outlinable => _outlinable;
        
        [SerializeField] private int _reloadStep;
        
        [SerializeField] private int _maxAmmoStock;
        public int MaxAmmoStock => _maxAmmoStock;
        
        [SerializeField] private int _maxAmmoMagazine;
        public int MaxAmmoMagazine => _maxAmmoMagazine;
        
        private int _currentAmmoMagazine;
        public int CurrentAmmoMagazine => _currentAmmoMagazine;
        
        private int _currentAmmoStock;
        public int CurrentAmmoStock => _currentAmmoStock;
        
        [SerializeField] private int _startAmmo;
        private void Start()
        {
            if (_startAmmo == 0)
            {
                _startAmmo = Random.Range(1, _maxAmmoMagazine);
            }
            
            var mag = _startAmmo < _maxAmmoMagazine ? _startAmmo : _maxAmmoMagazine;
            
            _currentAmmoMagazine = mag;
            _currentAmmoStock = _startAmmo - mag < _maxAmmoStock ? _startAmmo - mag : _maxAmmoStock;
        }

        public event IAmmo.AmmoState OnAmmoChanged;

        public void Changed()
        {
            OnAmmoChanged?.Invoke(this, _currentAmmoMagazine, _currentAmmoStock);
        }

        public bool IsMagazineFull()
        {
            return _currentAmmoMagazine == MaxAmmoMagazine;
        }

        public void Reload()
        {
            if (_reloadStep == 0)
            {
                var diff = MaxAmmoMagazine - _currentAmmoMagazine;
                var sum = diff >= _currentAmmoStock ? _currentAmmoStock : diff;

                _currentAmmoMagazine += sum;
                _currentAmmoStock -= sum;
            }
            else
            {
                if (_currentAmmoStock - _reloadStep >= 0 && _currentAmmoMagazine < _maxAmmoMagazine)
                {
                    _currentAmmoMagazine += _reloadStep;
                    _currentAmmoStock -= _reloadStep;
                }
            }

            Changed();
        }

        public int AddAmmo(int count)
        {
            var diff = MaxAmmoStock - _currentAmmoStock;
            var add = diff >= count ? count : diff;
            _currentAmmoStock += add;

            Changed();

            return add;
        }
        
        public void ReduceAmmo(int count)
        {
            if (count >= _currentAmmoMagazine)
            {
                _currentAmmoMagazine = 0;
                count -= _currentAmmoMagazine;
            }

            if (count >= _currentAmmoStock)
            {
                _currentAmmoStock = 0;
            }
            else
            {
                _currentAmmoStock -= count;
            }

            Changed();
        }

        public bool SpendAmmo(int count)
        {
            if (_currentAmmoMagazine - count >= 0)
            {
                _currentAmmoMagazine -= count;

                Changed();
                
                return true;
            }
            return false;
        }
    }
}