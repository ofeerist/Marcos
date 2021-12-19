using System;

namespace Character
{
    public interface IDamageable
    {
        delegate void Damage(float damage, float currentHealth, float maxHealth);
        event Damage OnDamage;

        event Action OnDeath;
        
        float MaxHP { get; }
        float CurrentHP { get; }
        
        void TakeDamage(float damage);
    }
}