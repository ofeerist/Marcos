using Character.Player.Interactable;
using UniRx;
using UnityEngine;

namespace Character.Player.PlayerInput
{
    public class Interaction : MonoBehaviour
    {
        [SerializeField] private InputHandler _inputHandler;
        [SerializeField] private LayerMask _interactable;
        [SerializeField] private Transform _character;
        [SerializeField] private float _radius;
        private IInteractable _lastInteractable;
        private Collider _lastCollider;
        private readonly Collider[] _results = new Collider[1];
        
        public delegate void Interact(IInteractable interactable);

        public event Interact OnInteract;
        
        public delegate string Highlight(IInteractable interactable, string description);

        public event Highlight OnHighlight;
        
        public delegate void Lowlight(IInteractable interactable);

        public event Lowlight OnLowlight;
        
        private void Start()
        {
            Observable.EveryUpdate().Subscribe(x =>
            {
                var size = Physics.OverlapSphereNonAlloc(_character.position, _radius, _results, _interactable);
                for (int i = 0; i < size; i++)
                {
                    var interactable = _results[i].GetComponent<IInteractable>();

                    OnInteract?.Invoke(interactable);
                    interactable.Interact();
                }
                
                var ray = _inputHandler.MainCamera.ScreenPointToRay(Input.mousePosition);
                if (Physics.Raycast(ray, out var hit, Mathf.Infinity, _interactable))
                {
                    if (_lastCollider == hit.collider) return;

                    _lastCollider = hit.collider;
                    var interactable = _lastCollider.gameObject.GetComponent<IInteractable>();
                    
                    if (_lastInteractable != null)
                    {
                        OnLowlight?.Invoke(_lastInteractable);
                        _lastInteractable.Lowlight();
                    }

                    var desc = interactable.Highlight();
                    OnHighlight?.Invoke(interactable, desc);
                    
                    _lastInteractable = interactable;
                }
                else
                {
                    if (_lastInteractable == null) return;

                    OnLowlight?.Invoke(_lastInteractable);
                    _lastInteractable.Lowlight();
                    _lastInteractable = null;
                }
               
            }).AddTo(this);

            _inputHandler.Interact += (ref bool state) =>
            {
                var ray = _inputHandler.MainCamera.ScreenPointToRay(Input.mousePosition);
                if (Physics.Raycast(ray, out var hit, Mathf.Infinity, _interactable))
                {
                    var interactable = hit.collider.gameObject.GetComponent<IInteractable>();

                    OnInteract?.Invoke(interactable);
                    interactable.Interact();

                    state = true;
                }
            };
        }
    }
}