using System;
using Character.Enemy;
using UnityEngine;
using UnityEngine.UI;

namespace UI
{
    public class EnemyHealthSlider : MonoBehaviour
    {
        [SerializeField] private EnemyHealth _enemyHealth;
        [SerializeField] private Slider _slider;

        private void Start()
        {
            _enemyHealth.OnDamage += EnemyHealthOnOnDamage;
        }

        private void EnemyHealthOnOnDamage(float damage, float currenthealth, float maxhealth)
        {
            _slider.value = currenthealth / maxhealth;
        }
    }
}