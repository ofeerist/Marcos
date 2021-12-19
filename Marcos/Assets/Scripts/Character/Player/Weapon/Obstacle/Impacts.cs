using System;
using System.Collections.Generic;
using UnityEngine;

namespace Character.Player.Weapon.Obstacle
{
    [Serializable]
    public class ImpactToLayer
    {
        public ObstacleImpact Obstacle;
        public ParticleSystem Impact;
    }
    [CreateAssetMenu(fileName = "Data", menuName = "Weapons/Impacts", order = 1)]
    public class Impacts : ScriptableObject
    {
        [SerializeField] private ImpactToLayer[] _impactToLayers;

        private Dictionary<ObstacleImpact, ParticleSystem> _dictionary;

        private void Init()
        {
            _dictionary = new Dictionary<ObstacleImpact, ParticleSystem>();
            foreach (var dict in _impactToLayers)
                if(!_dictionary.ContainsKey(dict.Obstacle))
                    _dictionary.Add(dict.Obstacle, dict.Impact);
        }
        
        public ParticleSystem GetImpact(ObstacleImpact obstacleImpact)
        {
            if (_dictionary == null) Init();

            return _dictionary[obstacleImpact];
        }
    }
}