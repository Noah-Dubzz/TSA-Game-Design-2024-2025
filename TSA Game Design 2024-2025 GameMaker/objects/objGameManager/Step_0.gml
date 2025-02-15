// Check if the game is over
if (global.gameover) {
    // Game over logic, no more turns
    show_debug_message("Game Over!");
    return;
}

// Handle the turn state machine
switch (global.turnstate) {
    case "turn_start":
        // Transition to 'turn_active' state (Player can take actions)
        global.turnstate = "turn_active";
        break;

    case "turn_active":
        // Handle player actions for the active turn (moving, playing, etc.)

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
                global.currentplayer = noone; // Default to no player
                break;
        }

        // Check if the current player is dead (using individual flags)
        if (global.currentturn == 1 && global.player_dead_1) {
            // Skip this player's turn if they are dead
            global.currentturn += 1;  // Move to the next player
            if (global.currentturn > global.amountofplayers) {
                global.currentturn = 1;  // Loop back to player 1
            }
            global.turnstate = "turn_start";  // Transition back to turn start state
            return;  // Exit the current step event to avoid processing the turn
        } else if (global.currentturn == 2 && global.player_dead_2) {
            global.currentturn += 1;
            if (global.currentturn > global.amountofplayers) {
                global.currentturn = 1;
            }
            global.turnstate = "turn_start";
            return;
        } else if (global.currentturn == 3 && global.player_dead_3) {
            global.currentturn += 1;
            if (global.currentturn > global.amountofplayers) {
                global.currentturn = 1;
            }
            global.turnstate = "turn_start";
            return;
        } else if (global.currentturn == 4 && global.player_dead_4) {
            global.currentturn += 1;
            if (global.currentturn > global.amountofplayers) {
                global.currentturn = 1;
            }
            global.turnstate = "turn_start";
            return;
        }

        // Check if the player is ready to end their turn (using the 'end_turn' function)
        if (global.endturn) {  // Triggered when the end turn button is pressed
            global.turnstate = "turn_end";  // Move to the turn_end state
            global.endturn = false;  // Reset the endturn flag after processing
        }
        break;

    case "turn_end":
        // Handle the end of the current turn
        global.currentturn += 1;  // Increment the turn to the next player
        
        // If the current turn exceeds the number of players, reset to Player 1
        if (global.currentturn > global.amountofplayers) {
            global.currentturn = 1;
        }
        
        // Transition back to the 'turn_start' state for the next player
        global.turnstate = "turn_start";
        break;

    default:
        // Catch-all to prevent the game from getting stuck in an invalid state
        global.turnstate = "turn_start";  // Reset to a safe state
        break;
}
