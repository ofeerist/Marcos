using System;
using System.Globalization;
using System.Text;
using Character.Player.Player;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace UI
{
    public class PlayerHealthSlider : MonoBehaviour
    {
        [SerializeField] private PlayerHealth _playerHealth;

        [SerializeField] private Slider _health;
        [SerializeField] private TextMeshProUGUI _healthText;
        
        [SerializeField] private Slider _armor;
        [SerializeField] private TextMeshProUGUI _armorText;
        
        private void Start()
        {
            _playerHealth.OnDamage += PlayerHealthOnOnDamage;
            _playerHealth.OnArmorChanged += PlayerHealthOnOnArmorChanged;
        }

        private void PlayerHealthOnOnArmorChanged(float damage, float currenthealth, float maxhealth)
        {
            _armor.value = currenthealth / maxhealth;
            var text = new StringBuilder();
            text.Append(Mathf.RoundToInt(_armor.value * 100));
            text.Append("%");
            _armorText.text = text.ToString();
        }

        private void PlayerHealthOnOnDamage(float damage, float currenthealth, float maxhealth)
        {
            _health.value = currenthealth / maxhealth;
            var text = new StringBuilder();
            text.Append(Mathf.RoundToInt(_health.value * 100));
            text.Append("%");
            _healthText.text = text.ToString();
        }
    }
}