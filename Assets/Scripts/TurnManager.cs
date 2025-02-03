using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class TurnManager : MonoBehaviour
{
    public Text playerMinionsText;
    public Text turnText; // UI text to display "Player X's Turn!"
    public Button endTurnButton;

    [Header("Turn Message Settings")]
    public float turnMessageDuration = 1.5f; // How long the text stays visible
    public float fadeDuration = 1f; // How long the fade-out takes

    void Start()
    {
        UpdateMinionsUI();
        StartCoroutine(ShowTurnMessage());
        endTurnButton.onClick.AddListener(EndTurn);
    }

    void EndTurn()
    {
        GameManager.Instance.NextTurn();
        UpdateMinionsUI();
        StartCoroutine(ShowTurnMessage()); // Show the new turn message
    }

    void UpdateMinionsUI()
    {
        int currentPlayer = GameManager.Instance.CurrentPlayer;
        playerMinionsText.text = $"Player {currentPlayer + 1}'s Minions: {GameManager.Instance.PlayerMinions[currentPlayer]}";

        // Set player color based on the turn
        Color playerColor = GetPlayerColor(currentPlayer);
        playerMinionsText.color = playerColor;
    }

    IEnumerator ShowTurnMessage()
    {
        int currentPlayer = GameManager.Instance.CurrentPlayer;
        Color playerColor = GetPlayerColor(currentPlayer); // Get the current player's color

        turnText.text = $"Player {currentPlayer + 1}'s Turn!";
        turnText.gameObject.SetActive(true);
        turnText.color = new Color(playerColor.r, playerColor.g, playerColor.b, 1f); // Set full opacity

        yield return new WaitForSeconds(turnMessageDuration); // Keep text visible for the specified duration

        // Smooth fade-out over fadeDuration
        float fadeStep = 1f / fadeDuration;
        for (float t = 1f; t >= 0; t -= Time.deltaTime * fadeStep)
        {
            turnText.color = new Color(playerColor.r, playerColor.g, playerColor.b, t);
            yield return null;
        }

        turnText.gameObject.SetActive(false);
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
