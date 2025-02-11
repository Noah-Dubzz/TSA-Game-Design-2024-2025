// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attack_p3(){
    // Delete the attack buttons
    // Assuming you have a button array or a direct reference to buttons
    close_attack_options();

    // Create a unit to attack Player 2
	global.doingsomething = false;
	global.currentplayer.resources = global.currentplayer.resources - global.unit_cost;
    create_unit(global.currentgenerator.x, global.currentgenerator.y, global.currentplayer, "Attacker", 3, 100, 20);  // Position, owner (player 1), target (Player 2), etc.
}
