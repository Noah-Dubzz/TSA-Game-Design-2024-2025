// Check if there are at least 3 players and it's Player 3's turn
if (global.amountofplayers >= 3 && global.currentturn == 3) {

    // Speed variable to control how fast the object moves
    var move_speed = 4;

    // Diagonal movement logic
    var move_x = 0;
    var move_y = 0;

    // Check for left and right movement (A/D or Arrow keys)
    if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
        move_x = -move_speed;  // Move left
    }
    if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
        move_x = move_speed;   // Move right
    }

    // Check for up and down movement (W/S or Arrow keys)
    if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
        move_y = -move_speed;  // Move up
    }
    if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
        move_y = move_speed;   // Move down
    }

    // Apply movement to objTheBlur (Player 3's character)
    x += move_x;
    y += move_y;

    // Set the correct sprite based on the direction of movement
    if (move_x < 0 && move_y == 0) {
        sprite_index = sprite_indexLeft;  // Moving left
    } else if (move_x > 0 && move_y == 0) {
        sprite_index = sprite_indexRight; // Moving right
    } else if (move_y < 0 && move_x == 0) {
        sprite_index = sprite_indexUp;    // Moving up
    } else if (move_y > 0 && move_x == 0) {
        sprite_index = sprite_indexDown;  // Moving down
    } else if (move_x < 0 && move_y < 0) {
        sprite_index = sprite_indexUpLeft;   // Moving up-left diagonally
    } else if (move_x > 0 && move_y < 0) {
        sprite_index = sprite_indexUpRight;  // Moving up-right diagonally
    } else if (move_x < 0 && move_y > 0) {
        sprite_index = sprite_indexDownLeft; // Moving down-left diagonally
    } else if (move_x > 0 && move_y > 0) {
        sprite_index = sprite_indexDownRight; // Moving down-right diagonally
    }

    // Optional: Add idle state if no movement keys are pressed
    if (move_x == 0 && move_y == 0) {
        sprite_index = sprite_indexIdle;  // Set idle sprite if no movement
    }

    // Check if Player 3 presses the "E" key to perform an action
    if (keyboard_check_pressed(ord("E")) && global.doingsomething == false) {
        global.doingsomething = true;  // Prevent multiple actions at once
        if (resources >= global.unit_cost) {  // Ensure enough resources

            // Get viewport position
            var view_x = camera_get_view_x(view_camera[0]);
            var view_y = camera_get_view_y(view_camera[0]);
            var view_w = camera_get_view_width(view_camera[0]);
            var view_h = camera_get_view_height(view_camera[0]);

            // Define button spacing and position for UI
            var btn_spacing = 80;
            var btn_x_start = view_x + 50; // 50 pixels from the left of the viewport
            var btn_y = view_y + view_h - 100; // 100 pixels from the bottom of the viewport

            // Dynamically create the button list based on the player's turn
            var btn_list = [];
            if (global.currentturn == 1) {
                btn_list = [objAttackP2, objAttackP3, objAttackP4];  // Player 1's turn
            } else if (global.currentturn == 2) {
                btn_list = [objAttackP1, objAttackP3, objAttackP4];  // Player 2's turn
            } else if (global.currentturn == 3) {
                btn_list = [objAttackP1, objAttackP2, objAttackP4];  // Player 3's turn
            } else if (global.currentturn == 4) {
                btn_list = [objAttackP1, objAttackP2, objAttackP3];  // Player 4's turn
            }

            // Create buttons dynamically, spaced correctly
            var btn_count = array_length_1d(btn_list); // Get number of buttons
            for (var i = 0; i < btn_count; i++) {
                var new_btn = instance_create_layer(btn_x_start + (btn_spacing * i), btn_y, "UI", btn_list[i]);
                new_btn.persistent = true;
                new_btn.follow_ui = true; // Ensure the button follows the UI
            }

            // Deduct resources after creating the buttons
            resources -= global.unit_cost;
        }
    }

} else {
    // If it's not Player 3's turn or there are less than 3 players, idle state
    sprite_index = sprite_indexIdle;  // Set idle sprite if no movement or actions are allowed
}
