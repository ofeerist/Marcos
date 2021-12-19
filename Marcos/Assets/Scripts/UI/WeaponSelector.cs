using Character.Player.Player;
using UniRx;
using UnityEngine;
using UnityEngine.UI;

namespace UI
{
    public class WeaponSelector : MonoBehaviour
    {
        [SerializeField]
        private PlayerInventory _playerInventory;

        [SerializeField] private Transform _container;
        [SerializeField] private Scrollbar _scrollbar;
        [SerializeField] private float _valueSpeed;
        private void Start()
        {
            _playerInventory.OnWeaponAdded += weapon =>
            {
                Instantiate(weapon.Characteristics.InventoryPrefab, _container);
            };

            Observable.EveryUpdate().Subscribe(x =>
            {
                if (_playerInventory.WeaponsCount <= 1) return;
                
                var value = 1f / (_playerInventory.WeaponsCount - 1) * _playerInventory.CurrentIndex;
                
                _scrollbar.value = Mathf.Lerp(_scrollbar.value, value,
                    _valueSpeed * Time.deltaTime);
            }).AddTo(this);
        }
    }
}