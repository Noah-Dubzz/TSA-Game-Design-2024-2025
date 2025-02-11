// Sample attack script for Player 1 attacking Player 2
function attack_p1() {
    // Delete the attack buttons
    // Assuming you have a button array or a direct reference to buttons
    close_attack_options();

    // Create a unit to attack Player 2
	global.doingsomething = false;
	global.currentplayer.resources = global.currentplayer.resources - global.unit_cost;
    create_unit(global.currentgenerator.x, global.currentgenerator.y, global.currentplayer, "Attacker", 1, 5, 20);  // Position, owner (player 1), target (Player 2), etc.
}