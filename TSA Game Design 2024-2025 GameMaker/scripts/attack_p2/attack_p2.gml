// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attack_p2(){
    // Delete the attack buttons
    // Assuming you have a button array or a direct reference to buttons
    close_attack_options();

    // Create a unit to attack Player 2
    create_unit(100, 100, global.currentplayer, "Attacker", 2, 100, 20);  // Position, owner (player 1), target (Player 2), etc.
}
