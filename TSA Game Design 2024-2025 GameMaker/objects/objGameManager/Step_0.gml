// Step Event in objTurnManager

// Check if game is over
if (global.gameover) {
    // Game over logic, no more turns
    show_message("Game Over!");
    return;
}

// Handle turn state machine
switch (global.turnstate) {
    case "turn_start":
        // Transition to 'turn_active' state
        global.turnstate = "turn_active";
        break;

    case "turn_active":
        // This is where the player can take their actions (move, play, etc.)
        // Example: enable movement or actions for the current player
        
        // Set the current player object based on the turn number
        switch(global.currentturn) {
            case 1:
                global.currentplayer = objP1;
                break;
            case 2:
                global.currentplayer = objP2;
                break;
            case 3:
                global.currentplayer = objP3;
                break;
            case 4:
                global.currentplayer = objP4;
                break;
            default:
                global.currentplayer = noone; // Default to no one if the turn number is out of range
                break;
        }
        
        // Check if the player is ready to end their turn (example: if End Turn is pressed)
        if (global.endturn == true) {  // Use '==' to compare
            global.turnstate = "turn_end";
            global.endturn = false;  // Reset end turn flag after handling
        }
        break;

    case "turn_end":
        // Handle any cleanup after the turn ends (e.g., update scores, animations, etc.)
        
        // Increment the turn and reset if necessary
        global.currentturn += 1;
        
        // If it exceeds the number of players, reset to Player 1
        if (global.currentturn > global.amountofplayers) {
            global.currentturn = 1;
        }
        
        // Transition back to 'turn_start' for the next player
        global.turnstate = "turn_start";
        break;

    default:
        // Catch-all case to handle any unexpected state
        global.turnstate = "turn_start";  // Safe default state
        break;
}
