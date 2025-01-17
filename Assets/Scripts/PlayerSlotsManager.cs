using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class PlayerSlotsManager : MonoBehaviour
{
    public GameObject playerSlotPrefab; // Prefab for player slots
    public Transform slotsContainer;   // Parent to hold all player slots
    public Button startButton;         // Start button reference

    private int currentPlayerCount = 2; // Start with 2 players
    private const int MaxPlayers = 4;
    private const int MinPlayers = 2;

    private void Start()
    {
        startButton.gameObject.SetActive(false); // Start button hidden initially
    }

    private void Update()
    {
        CheckIfAllSlotsFilled(); // Check if all player slots are assigned
    }

    public void AddPlayerSlot()
    {
        if (currentPlayerCount < MaxPlayers)
        {
            GameObject newSlot = Instantiate(playerSlotPrefab, slotsContainer);
            currentPlayerCount++;
        }
    }

    public void RemovePlayerSlot()
    {
        if (currentPlayerCount > MinPlayers)
        {
            Transform lastSlot = slotsContainer.GetChild(currentPlayerCount - 1);
            Destroy(lastSlot.gameObject);
            currentPlayerCount--;
        }
    }

    private void CheckIfAllSlotsFilled()
    {
        foreach (Transform slot in slotsContainer)
        {
            PlayerSlot playerSlot = slot.GetComponent<PlayerSlot>();
            if (!playerSlot.IsAssigned)
            {
                startButton.gameObject.SetActive(false); // Hide start button if any slot is unassigned
                return;
            }
        }

        startButton.gameObject.SetActive(true); // Show start button if all slots are filled
    }

    // Nested drop handler for detecting when a character is dropped onto a player slot
    public void OnDropCharacter(GameObject characterButton, PlayerSlot playerSlot)
    {
        if (playerSlot.IsAssigned) return; // Skip if slot is already assigned

        // Assign the character to the slot
        Image characterImage = characterButton.GetComponent<Image>();
        playerSlot.AssignCharacter(characterImage.sprite);
    }
}
