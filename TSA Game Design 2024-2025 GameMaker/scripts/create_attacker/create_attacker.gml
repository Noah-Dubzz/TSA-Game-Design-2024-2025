// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_attacker(){
// Script: create_attacker

// Starting position for the buttons
var start_x = 20;
var start_y = 520;
var button_width = 120;
var button_height = 40;
var button_spacing = 10;

// Track the current x position for button placement
var current_x = start_x;

// Loop through players 1 to 4
for (var i = 1; i <= global.amountofplayers; i++) {
    if (i != global.currentturn) {  // Skip the current player's turn
        // Determine the corresponding attack script
        var attack_script = asset_get_index("attack_p" + string(i));

        // Create the button dynamically
        create_button("Attack P" + string(i), current_x, start_y, button_width, button_height, "Attack P" + string(i), attack_script);

        // Move to the right for the next button
        current_x += button_width + button_spacing;
    }
}

// Add a "Cancel" button to close the attack options
create_button("Cancel", current_x, start_y, button_width, button_height, "Cancel", close_attack_options);

}