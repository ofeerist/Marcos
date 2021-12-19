using UnityEngine;

namespace Character.Player.Weapon
{
    [CreateAssetMenu(fileName = "Data", menuName = "WeaponCharacteristics", order = 1)]
    public class WeaponCharacteristics : ScriptableObject
    {
        [SerializeField] private GameObject _inventoryPrefab;
        public GameObject InventoryPrefab => _inventoryPrefab;
    
        [SerializeField] private int _ammoConsumption;
        public int AmmoConsumption => _ammoConsumption;
        
        [SerializeField] private AmmoTypes _ammoType;
        public AmmoTypes AmmoType => _ammoType;
        
        [SerializeField] private float _maxScope;
        public float MaxScope => _maxScope;
        
        [SerializeField] private float _movementSpeedPercent;
        public float MovementSpeedPercent => _movementSpeedPercent;
        
        [SerializeField] private float _scopeMovementSpeedPercent;
        public float ScopeMovementSpeedPercent => _scopeMovementSpeedPercent;
        
        [SerializeField] private Vector3 _posiion;
        public Vector3 Position => _posiion;
        
        [SerializeField] private Vector3 _rotation;
        public Vector3 Rotation => _rotation;
        
        [SerializeField] private Vector3 _scale;
        public Vector3 Scale => _scale;
    }
}