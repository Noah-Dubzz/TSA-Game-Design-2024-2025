// Speed variable to control how fast the object moves
var move_speed = 4;

// Diagonal movement logic
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

// Apply movement to objTheBlur
x += move_x;
y += move_y;

// Set the correct sprite based on the direction of movement
if (move_x < 0 && move_y == 0) {
    sprite_index = sprBlurLeft;  // Moving left
} 
else if (move_x > 0 && move_y == 0) {
    sprite_index = sprBlurRight; // Moving right
}
else if (move_y < 0 && move_x == 0) {
    sprite_index = sprBlurUp;    // Moving up
}
else if (move_y > 0 && move_x == 0) {
    sprite_index = sprBlurDown;  // Moving down
}
else if (move_x < 0 && move_y < 0) {
    sprite_index = sprBlurUpLeft;   // Moving up-left diagonally
}
else if (move_x > 0 && move_y < 0) {
    sprite_index = sprBlurUpRight;  // Moving up-right diagonally
}
else if (move_x < 0 && move_y > 0) {
    sprite_index = sprBlurDownLeft; // Moving down-left diagonally
}
else if (move_x > 0 && move_y > 0) {
    sprite_index = sprBlurDownRight; // Moving down-right diagonally
}

// Optional: Add idle state if no keys are pressed
if (move_x == 0 && move_y == 0) {
    sprite_index = sprBlurIdle;  // Set idle sprite if no movement
}
