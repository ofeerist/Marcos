using Character.Player.Player;
using DitzelGames.FastIK;
using UnityEngine;

namespace Character.Player.Weapon
{
    public class IKWeaponHandler : MonoBehaviour
    {
        [SerializeField] private PlayerInventory _playerInventory;

        [SerializeField] private FastIKFabric _rightFastIKFabric;
        [SerializeField] private FastIKFabric _leftFastIKFabric;

        private void Start()
        {
            _playerInventory.OnWeaponChanged += weapon =>
            {
                _rightFastIKFabric.Target = weapon.RightIKTransform;
                _leftFastIKFabric.Target = weapon.LeftIKTransform;
            };
        }
    }
}