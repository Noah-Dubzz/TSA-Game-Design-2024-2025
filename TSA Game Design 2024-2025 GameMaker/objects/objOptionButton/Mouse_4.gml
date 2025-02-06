// Check if the left mouse button is pressed
var isLeftMouseButtonPressed;
isLeftMouseButtonPressed = mouse_check_button_pressed(mb_left);
if (isLeftMouseButtonPressed) {
    room_goto(rmOptionsRoom); // Transition to the Options Room
}
