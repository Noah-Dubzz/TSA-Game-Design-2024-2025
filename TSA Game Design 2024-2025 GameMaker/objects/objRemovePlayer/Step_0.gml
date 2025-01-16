if (position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)) {
if (global.player_count > 2) {
    global.player_count -= 1; // Decrease player count
}
}