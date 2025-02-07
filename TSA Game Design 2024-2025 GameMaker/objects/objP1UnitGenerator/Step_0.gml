if (place_meeting(x, y, objP1)){
   // Check if the "E" key is pressed and ensure no action is currently being performed
    if (keyboard_check_pressed(ord("E")) && !global.doingsomething) { 
		if (objP1.resources >= global.unit_cost) {
        global.doingsomething = true; // Prevent multiple actions

        // Check if resources are enough to perform the action

            // Get the current viewport's position and size
            var view_x = camera_get_view_x(view_camera[0]);
            var view_y = camera_get_view_y(view_camera[0]);
            var view_w = camera_get_view_width(view_camera[0]);
            var view_h = camera_get_view_height(view_camera[0]);

            // Button placement and spacing for UI
            var scale_x = 0.2;
            var scale_y = 0.4146341;
            var spritewidth = 640 * scale_x;  // Scaled width = 128 pixels
            var padding = 20;                  // Extra spacing between buttons

            var btn_spacing = spritewidth + padding;  // 128 + 20 = 148 pixels
            var btn_x_start = view_x + 50;             // 50 pixels from the left of the viewport
            var btn_y = view_y + view_h - 100;         // 100 pixels from the bottom of the viewport

            // Create a button list based on the current player's turn
            var btn_list = [];
            switch (global.currentturn) {
                case 1: btn_list = [objAttackP2, objAttackP3, objAttackP4]; break;
                case 2: btn_list = [objAttackP1, objAttackP3, objAttackP4]; break;
                case 3: btn_list = [objAttackP1, objAttackP2, objAttackP4]; break;
                case 4: btn_list = [objAttackP1, objAttackP2, objAttackP3]; break;
            }

            // Create buttons dynamically based on the player’s turn
            var btn_count = array_length_1d(btn_list);
            for (var i = 0; i < btn_count; i++) {
                var new_btn = instance_create_layer(btn_x_start + (btn_spacing * i), btn_y, "UI", btn_list[i]);
                new_btn.persistent = true;
                new_btn.follow_ui = true;

                // Apply scaling
                new_btn.image_xscale = scale_x;
                new_btn.image_yscale = scale_y;
            }

            // Deduct the resources after creating the buttons
            objP1.resources -= global.unit_cost;
        }
    }
}