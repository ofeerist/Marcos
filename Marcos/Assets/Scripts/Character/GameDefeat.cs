using System;
using TMPro;
using UniRx;
using UnityEngine;
using UnityEngine.Rendering;

namespace Character
{
    public class GameDefeat : MonoBehaviour
    {
        [SerializeField] private Animator _defeatMenu;
        [SerializeField] private TextMeshProUGUI _score;
        [SerializeField] private GameObject _pause;

        public void Defeat()
        {
            Time.timeScale = 0;
            Cursor.visible = true;
            var seconds = Time.timeSinceLevelLoad;
            _score.text = $"Your time is {Mathf.RoundToInt(seconds / 60)}:{seconds % 60:00}";
            _pause.SetActive(false);
            _defeatMenu.Play("Window In");
        }
    }
}