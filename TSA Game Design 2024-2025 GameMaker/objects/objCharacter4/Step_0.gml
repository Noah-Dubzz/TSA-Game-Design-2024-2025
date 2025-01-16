// Check if the mouse is over the object and the left mouse button is held
if (position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)) {
    is_dragging = true; // Start dragging
}

// If the object is being dragged, follow the mouse position
if (is_dragging) {
    x = mouse_x;
    y = mouse_y;

    // Make the object smaller and transparent while dragging
    image_xscale = 0.9;
    image_yscale = 0.9;
    image_alpha = 0.7;

   // Loop through all players and check for a collision
var _collided_player = noone; // Default to no collision
with (objPlayer1) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        _collided_player = id;
    }
}
with (objPlayer2) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        _collided_player = id;
    }
}
with (objPlayer3) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        _collided_player = id;
    }
}
with (objPlayer4) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        _collided_player = id;
    }
}

// If there's a valid player object under the mouse, change its color
if (_collided_player != noone) {
    with (_collided_player) {
        image_blend = other.image_blend; // Use "other" to reference the dragging character
    }
}

    // Stop dragging when the left mouse button is released
    if (!mouse_check_button(mb_left)) {
        is_dragging = false;


        // Reset size and transparency
        image_xscale = 2.5;
        image_yscale = 2.5;
        image_alpha = 1;
		x = original_x;
		y = original_y;
    }
}