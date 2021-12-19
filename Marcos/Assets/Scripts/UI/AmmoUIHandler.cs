using System.Text;
using Character.Player.Player;
using Character.Player.Weapon;
using TMPro;
using UnityEngine;

namespace UI
{
    public class AmmoUIHandler : MonoBehaviour
    {
        [SerializeField] private PlayerInventory _playerInventory;
        [SerializeField] private TextMeshProUGUI _string;
        private IAmmo _current;
        
        private void Start()
        {
            _playerInventory.OnWeaponChanged += weapon =>
            {
                if(_current != null) _current.OnAmmoChanged -= CurrentOnOnAmmoChanged;

                if (weapon != null && weapon.Ammo != null)
                {
                    if (((Ammo)weapon.Ammo).AmmoType != AmmoTypes.pistol)
                    {
                        _current = weapon.Ammo;
                        _current.OnAmmoChanged += CurrentOnOnAmmoChanged;
                    }
                    else
                    {
                        _string.text = "<size=100>∞";
                    }
                }
                else if (weapon != null)
                {
                    _string.text = "<size=100>0</size><size=90>/</size>0";
                }
            };
        }

        private void CurrentOnOnAmmoChanged(Ammo ammo, int magazine, int stock)
        {
            var str = new StringBuilder();
            str.Append("<size=100>");
            str.Append(magazine);
            str.Append("</size><size=90>/</size>");
            str.Append(stock);

            _string.text = str.ToString();
        }
    }
}