// Script: end_turn
// This script will handle the end of a player's turn, setting the necessary flags for game flow.

function end_turn() {
    // Set the global.endturn flag to true to signal that the turn should end
	if (global.doingsomething = false){
    global.endturn = true;
	}
    // Optionally, handle other actions (e.g., resource updates, etc.) when the turn ends
    // Example: global.resources[global.currentturn - 1] -= 10;  // Deduct some resources
    
    // You can add any other game-specific behavior here, like animations or actions that should occur at the end of a turn.
}
