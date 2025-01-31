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
        // For example, enable movement or actions for the current player
        
        // Once the player is done, transition to 'turn_end'
        // Let's simulate that the player is ready to end their turn.
        // You can trigger this with any event, like a button press or a mouse click.
        if (global.endturn = true) {
            global.turnstate = "turn_end";
			global.endturn = false;
        }
        break;

    case "turn_end":
        // Handle any cleanup after the turn ends
        // This can include things like updating scores, animations, or UI
        
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
        // Catch all case to handle any unexpected state
        global.turnstate = "turn_start";
        break;
}
