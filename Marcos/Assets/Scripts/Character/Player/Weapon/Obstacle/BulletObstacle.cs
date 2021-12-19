using UnityEngine;

namespace Character.Player.Weapon.Obstacle
{
    public class BulletObstacle : MonoBehaviour
    {
        [SerializeField] private ObstacleImpact _obstacleImpact;
        public ObstacleImpact ObstacleImpact => _obstacleImpact;

        [SerializeField] private float _bulletEnergyLossPerUnit;
        public float BulletEnergyLossPerUnit => _bulletEnergyLossPerUnit;
        
        [SerializeField] private float _minimumBulletEnergyToPenetrate;
        public float MinimumBulletEnergyToPenetrate => _minimumBulletEnergyToPenetrate;

        [SerializeField] private float _minimumBulletEnergyToReflect;
        public float MinimumBulletEnergyToReflect => _minimumBulletEnergyToReflect;
        
        [SerializeField] private float _maximumAngleToReflect;
        public float MaximumAngleToReflect => _maximumAngleToReflect;
        
        [SerializeField] private float _bulletEnergyLossByReflect;
        public float BulletEnergyLossByReflect => _bulletEnergyLossByReflect;
        
        [SerializeField] private Impacts _impacts;
        
        public void CreateImpact(Vector3 position, Vector3 normal)
        {
            var pref = _impacts.GetImpact(_obstacleImpact);
            if (pref != null)
            {
                var effect = Instantiate(pref);

                var efftr = effect.transform;
                efftr.position = position;
                efftr.up = normal;
            }
        }
    }
}