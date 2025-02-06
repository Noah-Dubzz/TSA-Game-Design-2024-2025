// Check if the left mouse button is pressed
var isLeftMouseButtonPressed;
isLeftMouseButtonPressed = mouse_check_button_pressed(mb_left);
if (isLeftMouseButtonPressed) {
    room_goto(rmTitleScreen); // Transition to the Title Screen room
}

// Check if the Escape key is pressed
var isEscapeKeyPressed;
isEscapeKeyPressed = keyboard_check_pressed(vk_escape);
if (isEscapeKeyPressed) {
    room_goto(rmTitleScreen); // Transition to the Title Screen room
}
