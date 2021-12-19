using System;
using Character.Player.Interactable;
using Character.Player.PlayerInput;
using UnityEngine;

namespace Character.Player.Player
{
    public class PlayerHealth : MonoBehaviour, IDamageable
    {
        public event IDamageable.Damage OnDamage;
        public event IDamageable.Damage OnArmorChanged;
        public event Action OnDeath;
        
        [SerializeField] private Interaction _interaction;
        
        [Header("Armor")] 
        
        [SerializeField] private float _maxArmor;

        [SerializeField] private float _currentArmor;
        [SerializeField] private float _blockPercent;
        [SerializeField] private float _consumptionByOneDamage;
        [SerializeField] private GameDefeat _gameDefeat;
        
        [Header("HP")]
        [SerializeField] private float _maxHP;
        private float _currentHP;
        
        public float MaxHP => _maxHP;
        public float CurrentHP => _currentHP;

        private void Start()
        {
            _currentHP = MaxHP;
            
            OnDamage?.Invoke(0, _currentHP, _maxHP);
            OnArmorChanged?.Invoke(0, _currentArmor, _maxArmor);

            _interaction.OnInteract += interactable =>
            {
                switch (interactable)
                {
                    case HPInteractable hpInteractable:
                        AddHealth(hpInteractable.HPRestore);
                        break;
                    case ArmorInteractable armorInteractable:
                        AddArmor(armorInteractable.ArmorRestore);
                        break;
                }
            };
        }

        public void TakeDamage(float damage)
        {
            ArmorProtect(ref damage);
            _currentHP -= damage;

            if (_currentHP <= 0)
            {
                Death();
                return;
            }
            
            OnDamage?.Invoke(damage, _currentHP, _maxHP);
        }

        public void AddArmor(float armor)
        {
            _currentArmor = _currentArmor + armor > _maxArmor ? _maxArmor : _currentArmor + armor;
            
            OnArmorChanged?.Invoke(0, _currentArmor, _maxArmor);
        }
        
        public void AddHealth(float hp)
        {
            _currentHP = _currentHP + hp > _maxHP ? _maxHP : _currentHP + hp;
            
            OnDamage?.Invoke(0, _currentHP, _maxHP);
        }
        
        private void ArmorProtect(ref float damage)
        {
            var blocks = damage - damage * (1 - _blockPercent);
            var consumption = blocks * _consumptionByOneDamage;
            
            if (_currentArmor - consumption > 0)
            {
                _currentArmor -= consumption;
                damage -= blocks;
            }
            else
            {
                _currentArmor = 0;
                damage -= blocks * (_currentArmor / consumption);
            }

            OnArmorChanged?.Invoke(damage, _currentArmor, _maxArmor);
        }
        
        private void Death()
        {
            OnDeath?.Invoke();
            _gameDefeat.Defeat();
        }
    }
}