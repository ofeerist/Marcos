using System;
using System.Collections.Generic;
using UnityEngine;
using Object = UnityEngine.Object;

namespace Misc
{
    public class Pool<T> where T : PooledItem
    {
        private readonly Queue<T> _available;

        public Pool(T prefab, int count, Transform parent = null)
        {
            _available = new Queue<T>();
            for (int i = 0; i < count; i++)
            {
                var entity = Object.Instantiate(prefab, parent);
                entity.gameObject.SetActive(false);
                entity.OnDestroy += item => _available.Enqueue(item as T);
                _available.Enqueue(entity);
            }
        }

        public bool TryInstantiate(out T instantiateEntity, Vector3 position, Quaternion rotation)
        {
            if (_available.Count > 0)
            {
                instantiateEntity = _available.Dequeue();
                instantiateEntity.transform.SetPositionAndRotation(position, rotation);
                instantiateEntity.gameObject.SetActive(true);
                return true;
            }

            instantiateEntity = null;
            return false;
        }
    }

    public abstract class PooledItem : MonoBehaviour
    {
        public event Action<PooledItem> OnDestroy;

        protected void ReturnToPool()
        {
            gameObject.SetActive(false);
            OnDestroy?.Invoke(this);
        }
    }
}