// Draw Event of objButton

// Draw the button's sprite (if you have a sprite for the button, else you can skip this)
draw_self();

// Get the camera's position
var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

// Set the font and color
draw_set_font(Medival);  // Set your font (adjust as needed)
draw_set_color(c_black);  // Set the color for the text (adjust as needed)

// Get the width and height of the button text
var text_width = string_width(button_text);  // Get the width of the button text
var text_height = string_height(button_text);  // Get the height of the button text

// Adjust the position of the text, accounting for the camera's position
var textX = button_x + (button_width - text_width) / 2 + camX;  // Center text horizontally with camera offset
var textY = button_y + (button_height - text_height) / 2 + camY;  // Center text vertically with camera offset

// Draw the text in the center of the button
draw_text(textX, textY, button_text);
