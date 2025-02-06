// Ensure that the object is following UI
if (follow_ui) {
    // Get viewport information
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

    // Map of buttons based on the current player's turn
    var btn_map = [
        [objAttackP2, objAttackP3, objAttackP4], // Player 1's turn
        [objAttackP1, objAttackP3, objAttackP4], // Player 2's turn
        [objAttackP1, objAttackP2, objAttackP4], // Player 3's turn
        [objAttackP1, objAttackP2, objAttackP3]  // Player 4's turn
    ];

    // Get the appropriate button list for the current turn
    var btn_list = btn_map[global.currentturn - 1];

    // Calculate the position of the button based on its order in btn_list
    var btn_count = array_length_1d(btn_list); // Get the number of buttons
    for (var i = 0; i < btn_count; i++) {
        // If this button matches the one in the list, update its position
        if (id == instance_nearest(x, y, btn_list[i])) {
            x = btn_x_start + (btn_spacing * i); // Position based on the order
            y = btn_y; // Fixed vertical position
        }
    }
}