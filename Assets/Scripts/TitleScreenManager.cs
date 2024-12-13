using UnityEngine;
using UnityEngine.SceneManagement;

public class TitleScreenManager : MonoBehaviour
{
    // This method must be public to show up in the dropdown
    public void LoadCharacterSelection()
    {
        SceneManager.LoadScene("CharacterSelection");
    }
}
