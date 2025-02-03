if (global.currentturn == 1){	// Speed variable to control how fast the object moves
// If left mouse is clicked and it's this player's turn
if (keyboard_check(ord("E"))){
    if (resources >= global.unit_cost) {
        var new_unit = instance_create_layer(mouse_x, mouse_y, "Units", objUnit);
        new_unit.owner = 1; // Assign ownership to Player 1
        resources -= global.unit_cost;
    }
}

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


// Optional: Add idle state if no keys are pressed
if (move_x == 0 && move_y == 0) {
    sprite_index = sprite_indexIdle;  // Set idle sprite if no movement
}
} else {
	sprite_index = sprite_indexIdle;
}