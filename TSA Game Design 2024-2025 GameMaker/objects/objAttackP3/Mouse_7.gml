// Create a unit at the given position with the relevant parameters
scr_create_unit(x, y, global.currentturn, global.currentplayer, 1, objP3);

// Set the flag to false after performing the action
global.doingsomething = false;

// List of attack buttons to destroy
var attack_buttons = [objAttackP1, objAttackP2, objAttackP3, objAttackP4];

// Destroy the attack buttons if they exist
for (var i = 0; i < array_length_1d(attack_buttons); i++) {
    if (instance_exists(attack_buttons[i])) {
        instance_destroy(attack_buttons[i]);
    }
}
