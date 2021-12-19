namespace Character.Player.Weapon
{
    public interface IAmmo
    {
        public delegate void AmmoState(Ammo ammo, int magazine, int stock);

        public event AmmoState OnAmmoChanged;

        void Changed();
        bool IsMagazineFull();
        void Reload();
        int AddAmmo(int count);
        void ReduceAmmo(int count);
        bool SpendAmmo(int count);
    }
}