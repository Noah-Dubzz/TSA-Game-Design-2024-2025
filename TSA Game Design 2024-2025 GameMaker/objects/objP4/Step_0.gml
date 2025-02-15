// -----------------------------------------
// 1. Check if any of this player's units are gatherers
var hasGatherer = false;
with (objUnit) {
    if (global.currentturn == 4 && owner == objP4 && type == "Gatherer") {
        hasGatherer = true;
        // Debugging: print out when a gatherer is found
    }
}

// Update global.gettingresources based on whether we found a gatherer
global.gettingresources = hasGatherer;


// -----------------------------------------
// 2. Check if any enemy units have this player as a target
var underAttack = false;
with (objUnit) {
    if (global.currentturn == 4 && target == objP4) {
        underAttack = true;
        // Debugging: print out when a unit is targeting objP1
    }
}

// Update global.underattack based on whether we found any attackers
global.underattack = underAttack;

if (!instance_exists(objP1) && !instance_exists(objP2) && !instance_exists(objP3)) {
    // All three players (P1, P2, P3) are gone
    global.winner = 4;
	room_goto(rmWin);
} 
// Check if it's Player 4's turn
if (global.currentturn == 4) {
    global.currentplayer = objP4;
    global.currentgenerator = objP4UnitGenerator;
    
    // Detect collision with the unit generator
    global.colliding = place_meeting(x, y, objP4UnitGenerator);

    // Ensure the player can move only if they are not performing an action
    if (global.doingsomething == false) {
        var move_speed = 4; // Movement speed
        var move_x = 0;
        var move_y = 0;

        // Check horizontal movement
        if (keyboard_check(vk_left) || keyboard_check(ord("A"))) move_x = -move_speed;
        if (keyboard_check(vk_right) || keyboard_check(ord("D"))) move_x = move_speed;
        
        // Check vertical movement
        if (keyboard_check(vk_up) || keyboard_check(ord("W"))) move_y = -move_speed;
        if (keyboard_check(vk_down) || keyboard_check(ord("S"))) move_y = move_speed;
        
        // Apply movement
        x += move_x;
        y += move_y;
        
        // Set correct sprite based on movement direction
        if (move_x < 0 && move_y == 0) sprite_index = sprite_indexLeft;
        else if (move_x > 0 && move_y == 0) sprite_index = sprite_indexRight;
        else if (move_y < 0 && move_x == 0) sprite_index = sprite_indexUp;
        else if (move_y > 0 && move_x == 0) sprite_index = sprite_indexDown;
        else if (move_x < 0 && move_y < 0) sprite_index = sprite_indexUpLeft;
        else if (move_x > 0 && move_y < 0) sprite_index = sprite_indexUpRight;
        else if (move_x < 0 && move_y > 0) sprite_index = sprite_indexDownLeft;
        else if (move_x > 0 && move_y > 0) sprite_index = sprite_indexDownRight;
        
        // If no movement, set to idle
        if (move_x == 0 && move_y == 0) sprite_index = sprite_indexIdle;
    }
} else {
    // If it's not Player 4's turn, keep the sprite idle
    sprite_index = sprite_indexIdle;
}