// Update the turn display in the Draw GUI event
var player_names = ["Player 1", "Player 2", "Player 3", "Player 4"];
var current_player = global.currentturn - 1; // Adjust for player index

// Set a default font size (for example, 24)
var font_size = 24;  // Set your desired font size here

// Use a system font (or replace it with a custom one if needed)
draw_set_font(font_size);  // Set the font size (use system font)
draw_set_color(c_white);  // Set text color to white
draw_text(10, 40, "Turn: " + player_names[current_player]);  // Draw the turn text
