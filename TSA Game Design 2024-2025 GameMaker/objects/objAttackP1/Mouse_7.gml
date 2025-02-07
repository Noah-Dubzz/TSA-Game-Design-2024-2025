create_unit(global.currentplayer.x, global.currentplayer.y, global.currentplayer, 1, objP1, 10, 1);

// Remove the button once the unit is created
global.doingsomething = false;
var attack_buttons = [objAttackP1, objAttackP2, objAttackP3, objAttackP4];
for (var i = 0; i < array_length_1d(attack_buttons); i++) {
    if (instance_exists(attack_buttons[i])) {
        instance_destroy(attack_buttons[i]);
    }
}