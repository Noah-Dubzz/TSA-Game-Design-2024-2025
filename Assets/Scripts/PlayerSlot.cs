using UnityEngine;
using UnityEngine.UI;

public class PlayerSlot : MonoBehaviour
{
    public bool IsAssigned { get; private set; } // Track if the slot is assigned
    private Image slotImage; // To hold the assigned character's image

    private void Awake()
    {
        slotImage = GetComponent<Image>(); // Assuming the PlayerSlot has an Image component
        IsAssigned = false; // Initial state, not assigned
    }

    // Method to assign a character to the slot
    public void AssignCharacter(Sprite characterSprite)
    {
        slotImage.sprite = characterSprite; // Set the sprite for the slot
        IsAssigned = true; // Mark the slot as assigned
    }

    // Optionally, you can have a method to clear the assignment (if needed)
    public void ClearSlot()
    {
        slotImage.sprite = null;
        IsAssigned = false;
    }
}
