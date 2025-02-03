using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class TurnManager : MonoBehaviour
{
    public Text playerMinionsText;
    public Text turnText;
    public Button endTurnButton;

    [Header("Turn Message Settings")]
    public float turnMessageDuration = 1.5f; // How long the text stays visible
    public float fadeDuration = 1f; // How long the fade-out takes

    [Header("Camera Settings")]
    public Camera[] playerCameras; // Assign cameras for players (Array Size: 4)

    void Start()
    {
        UpdateMinionsUI();
        StartCoroutine(ShowTurnMessage());
        SwitchCamera(GameManager.Instance.CurrentPlayer);
        endTurnButton.onClick.AddListener(EndTurn);
    }

    void EndTurn()
    {
        GameManager.Instance.NextTurn();
        UpdateMinionsUI();
        StartCoroutine(ShowTurnMessage());
        SwitchCamera(GameManager.Instance.CurrentPlayer); // Switch camera to new player
    }

    void UpdateMinionsUI()
    {
        int currentPlayer = GameManager.Instance.CurrentPlayer;
        playerMinionsText.text = $"Player {currentPlayer + 1}'s Minions: {GameManager.Instance.PlayerMinions[currentPlayer]}";

        Color playerColor = GetPlayerColor(currentPlayer);
        playerMinionsText.color = playerColor;
    }

    IEnumerator ShowTurnMessage()
    {
        int currentPlayer = GameManager.Instance.CurrentPlayer;
        Color playerColor = GetPlayerColor(currentPlayer);

        turnText.text = $"Player {currentPlayer + 1}'s Turn!";
        turnText.gameObject.SetActive(true);
        turnText.color = new Color(playerColor.r, playerColor.g, playerColor.b, 1f);

        yield return new WaitForSeconds(turnMessageDuration);

        float fadeStep = 1f / fadeDuration;
        for (float t = 1f; t >= 0; t -= Time.deltaTime * fadeStep)
        {
            turnText.color = new Color(playerColor.r, playerColor.g, playerColor.b, t);
            yield return null;
        }

        turnText.gameObject.SetActive(false);
    }

    void SwitchCamera(int currentPlayer)
    {
        int totalPlayers = GameManager.Instance.TotalPlayers;
        int cameraIndex = currentPlayer;

        // If only 2 players, Player 2 uses Player 4’s camera
        if (totalPlayers == 2 && currentPlayer == 1)
        {
            cameraIndex = 3; // Use Player 4's camera for Player 2
        }

        // Disable all cameras
        foreach (Camera cam in playerCameras)
        {
            if (cam != null) cam.gameObject.SetActive(false);
        }

        // Enable the correct camera
        if (playerCameras[cameraIndex] != null)
        {
            playerCameras[cameraIndex].gameObject.SetActive(true);
        }
        else
        {
            Debug.LogError($"Camera for Player {currentPlayer + 1} is missing!");
        }
    }

    Color GetPlayerColor(int playerIndex)
    {
        switch (playerIndex)
        {
            case 0: return Color.blue;
            case 1: return Color.red;
            case 2: return Color.green;
            case 3: return Color.yellow;
            default: return Color.white;
        }
    }
}
