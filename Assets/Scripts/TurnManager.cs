using UnityEngine;
using UnityEngine.UI; // For UI elements like Text and Button
using System.Collections;

public class TurnManager : MonoBehaviour
{
    [Header("Player Settings")]
    public int totalPlayers = 4;   // Total number of players (2-4)
    public int startingMinions = 20; // Starting minions for each player

    private int currentPlayer = 0; // Start with Player 1 (0-indexed)
    private int[] playerMinions;   // Array to store the number of minions for each player

    [Header("UI Settings")]
    public Text playerMinionsText; // Text to display the current player's minions
    public Button endTurnButton;  // Button to end the turn

    void Start()
    {
        playerMinions = new int[totalPlayers];

        // Initialize all players with starting minions
        for (int i = 0; i < totalPlayers; i++)
        {
            playerMinions[i] = startingMinions;
        }

        // Setup UI
        UpdateMinionsUI();

        // Set up the End Turn button listener
        endTurnButton.onClick.AddListener(EndTurn);
    }

    void EndTurn()
    {
        // Move to the next player
        currentPlayer = (currentPlayer + 1) % totalPlayers;

        // Update the UI for the new current player
        UpdateMinionsUI();
    }

    void UpdateMinionsUI()
    {
        // Display the current player's number of minions
        playerMinionsText.text = $"Player {currentPlayer + 1}'s Minions: {playerMinions[currentPlayer]}";

        // Optionally, change the color to show whose turn it is
        // For example, highlight the current player's color
        switch (currentPlayer)
        {
            case 0: playerMinionsText.color = Color.blue; break;
            case 1: playerMinionsText.color = Color.red; break;
            case 2: playerMinionsText.color = Color.green; break;
            case 3: playerMinionsText.color = Color.yellow; break;
        }
    }
}
