// Player 2's turn logic
if (global.currentturn == 2 && !global.doingsomething) {

    // Movement variables and speed setup
    var move_speed = 4;
    var move_x = 0;
    var move_y = 0;

    // Check for left and right movement
    if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
        move_x = -move_speed;  // Move left
    }
    if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
        move_x = move_speed;   // Move right
    }

    // Check for up and down movement
    if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
        move_y = -move_speed;  // Move up
    }
    if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
        move_y = move_speed;   // Move down
    }

    // Apply movement to objTheBlur (or player character)
    x += move_x;
    y += move_y;

    // Set the correct sprite based on the direction of movement
    if (move_x < 0 && move_y == 0) {
        sprite_index = sprite_indexLeft;  // Moving left
    } 
    else if (move_x > 0 && move_y == 0) {
        sprite_index = sprite_indexRight; // Moving right
    }
    else if (move_y < 0 && move_x == 0) {
        sprite_index = sprite_indexUp;    // Moving up
    }
    else if (move_y > 0 && move_x == 0) {
        sprite_index = sprite_indexDown;  // Moving down
    }
    else if (move_x < 0 && move_y < 0) {
        sprite_index = sprite_indexUpLeft;   // Moving up-left diagonally
    }
    else if (move_x > 0 && move_y < 0) {
        sprite_index = sprite_indexUpRight;  // Moving up-right diagonally
    }
    else if (move_x < 0 && move_y > 0) {
        sprite_index = sprite_indexDownLeft; // Moving down-left diagonally
    }
    else if (move_x > 0 && move_y > 0) {
        sprite_index = sprite_indexDownRight; // Moving down-right diagonally
    }

    // If no keys are pressed, set the sprite to idle (when character is not moving)
    if (move_x == 0 && move_y == 0) {
        sprite_index = sprite_indexIdle;  // Idle state
    }

	// Declare a variable to keep track of the whistle instance
if (!instance_exists(whistle_instance)) {
    var whistle_instance = noone;
}

// Check if the right mouse button is held down
if (mouse_check_button(mb_right)) {
    // Create the whistle instance if it doesn't exist yet
    if (!instance_exists(whistle_instance)) {
        whistle_instance = instance_create_layer(mouse_x, mouse_y, "Instances", objP2Whistle);
    }
    
    // Update the whistle's position to follow the mouse
    if (instance_exists(whistle_instance)) {
        whistle_instance.x = mouse_x;
        whistle_instance.y = mouse_y;
    }
} else {
    // Destroy the whistle instance when the right mouse button is released
    if (instance_exists(whistle_instance)) {
        instance_destroy(whistle_instance);
        whistle_instance = noone;
    }
}

} else {
    // If it's not Player 1's turn, set the sprite to idle state
    sprite_index = sprite_indexIdle;
}
