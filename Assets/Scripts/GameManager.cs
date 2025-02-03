using UnityEngine;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance { get; private set; }

    public int TotalPlayers = 4;
    public int StartingMinions = 20;
    public int CurrentPlayer = 0;
    public int[] PlayerMinions;

    void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject); // Ensure only one instance exists
            return;
        }

        Instance = this;
        DontDestroyOnLoad(gameObject); // Keep this object across scenes

        // Initialize player minions
        PlayerMinions = new int[TotalPlayers];
        for (int i = 0; i < TotalPlayers; i++)
        {
            PlayerMinions[i] = StartingMinions;
        }
    }

    public void NextTurn()
    {
        CurrentPlayer = (CurrentPlayer + 1) % TotalPlayers;
    }
}
