using UnityEngine;

namespace Character.Player.Weapon
{
    public interface IWeapon 
    {
        delegate void OnShoot();
        event OnShoot BeforeShoot;

        WeaponCharacteristics GetCharacteristics();
        
        void Reload();
        void StopReload();
        
        bool Shoot();

        float GetCooldown();

        bool AutoAttack();
    }
}