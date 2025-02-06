// Player 1's turn logic
if (global.currentturn == 1) {

    // Check if the "E" key is pressed and ensure no action is currently being performed
    if (keyboard_check_pressed(ord("E")) && !global.doingsomething) { 
        global.doingsomething = true; // Prevent multiple actions

        // Check if resources are enough to perform the action
        if (resources >= global.unit_cost) {

            // Get the current viewport's position and size
            var view_x = camera_get_view_x(view_camera[0]);
            var view_y = camera_get_view_y(view_camera[0]);
            var view_w = camera_get_view_width(view_camera[0]);
            var view_h = camera_get_view_height(view_camera[0]);

            // Button placement and spacing for UI
            var btn_spacing = 80;
            var btn_x_start = view_x + 50;  // 50 pixels from the left of the viewport
            var btn_y = view_y + view_h - 100;  // 100 pixels from the bottom of the viewport

            // Create a button list based on the current player's turn
            var btn_list = [];
            switch (global.currentturn) {
                case 1: // Player 1's turn
                    btn_list = [objAttackP2, objAttackP3, objAttackP4];
                    break;
                case 2: // Player 2's turn
                    btn_list = [objAttackP1, objAttackP3, objAttackP4];
                    break;
                case 3: // Player 3's turn
                    btn_list = [objAttackP1, objAttackP2, objAttackP4];
                    break;
                case 4: // Player 4's turn
                    btn_list = [objAttackP1, objAttackP2, objAttackP3];
                    break;
            }

            // Create buttons dynamically based on the player’s turn
            var btn_count = array_length_1d(btn_list);  // Get number of buttons to create
            for (var i = 0; i < btn_count; i++) {
                var new_btn = instance_create_layer(btn_x_start + (btn_spacing * i), btn_y, "UI", btn_list[i]);
                new_btn.persistent = true; // Keep button persistent
                new_btn.follow_ui = true;  // Ensure the buttons follow UI movements
            }

            // Deduct the resources after creating the buttons
            resources -= global.unit_cost;
        }
    }

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

} else {
    // If it's not Player 1's turn, set the sprite to idle state
    sprite_index = sprite_indexIdle;
}
