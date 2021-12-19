using UnityEngine;

namespace Localization
{
    public class LocalizationDeserializer
    {
        public Localized Deserialize(string path)
        {
            return JsonUtility.FromJson<Localized>(Resources.Load<TextAsset>(path).text);
        }
    }
}