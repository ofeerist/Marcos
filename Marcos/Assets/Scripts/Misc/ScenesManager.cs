using UnityEngine;
using UnityEngine.SceneManagement;

namespace Misc
{
    public class ScenesManager : MonoBehaviour
    {
        public void Restart()
        {
            SceneManager.LoadSceneAsync("Scenes/SampleScene").completed += Oncompleted;
        }

        private void Oncompleted(AsyncOperation obj)
        {
            Time.timeScale = 1;
            obj.completed -= Oncompleted;
        }

        public void ToMainMenu()
        {
            SceneManager.LoadSceneAsync("Scenes/MainMenu");
        }

        public void Quit()
        {
#if UNITY_EDITOR
            UnityEditor.EditorApplication.isPlaying = false;
#else
            Application.Quit();
#endif
        }
    }
}