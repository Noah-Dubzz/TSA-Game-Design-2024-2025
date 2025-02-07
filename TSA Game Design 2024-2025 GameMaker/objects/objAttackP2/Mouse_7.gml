// Check which player is the current player and use the appropriate unit generator
if (global.currentplayer == objP1) {
    var currentgenx = objP1UnitGenerator.x;
    var currentgeny = objP1UnitGenerator.y;
    show_debug_message("Player 1: Unit Generator position is (" + string(currentgenx) + ", " + string(currentgeny) + ")");
    create_unit(currentgenx, currentgeny, global.currentplayer, 1, objP2, 10, 1);
}
else if (global.currentplayer == objP2) {
    var currentgenx = objP2UnitGenerator.x;
    var currentgeny = objP2UnitGenerator.y;
    show_debug_message("Player 2: Unit Generator position is (" + string(currentgenx) + ", " + string(currentgeny) + ")");
    create_unit(currentgenx, currentgeny, global.currentplayer, 1, objP2, 10, 1);
}
else if (global.currentplayer == objP3) {
    var currentgenx = objP3UnitGenerator.x;
    var currentgeny = objP3UnitGenerator.y;
    show_debug_message("Player 3: Unit Generator position is (" + string(currentgenx) + ", " + string(currentgeny) + ")");
    create_unit(currentgenx, currentgeny, global.currentplayer, 1, objP2, 10, 1);
}
else if (global.currentplayer == objP4) {
    var currentgenx = objP4UnitGenerator.x;
    var currentgeny = objP4UnitGenerator.y;
    show_debug_message("Player 4: Unit Generator position is (" + string(currentgenx) + ", " + string(currentgeny) + ")");
    create_unit(currentgenx, currentgeny, global.currentplayer, 1, objP2, 10, 1);
}
else {
    show_debug_message("Error: Invalid value for global.currentplayer: " + string(global.currentplayer));
}

// Remove the button once the unit is created
global.doingsomething = false;
var attack_buttons = [objAttackP1, objAttackP2, objAttackP3, objAttackP4];
for (var i = 0; i < array_length_1d(attack_buttons); i++) {
    if (instance_exists(attack_buttons[i])) {
        instance_destroy(attack_buttons[i]);
    }
}