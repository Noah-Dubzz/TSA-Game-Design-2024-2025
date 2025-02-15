function create_attacker() {
	audio_play_sound(sndButtonPress, 1, false);
    // Starting position for the buttons
    var start_x = 5;
    var start_y = 510;
    var button_width = 120;
    var button_height = 40;
    var button_spacing = 10;

    // Track the current x position for button placement
    var current_x = start_x;

    // Loop through players 1 to 4
    for (var i = 1; i <= global.amountofplayers; i++) {
        if (i != global.currentturn) {  // Skip the current player's turn
            // Check if the target player is dead by using individual dead flags
            if (i == 1 && global.player_dead_1) {
                continue;  // Skip creating the attack button for Player 1 if dead
            } else if (i == 2 && global.player_dead_2) {
                continue;  // Skip creating the attack button for Player 2 if dead
            } else if (i == 3 && global.player_dead_3) {
                continue;  // Skip creating the attack button for Player 3 if dead
            } else if (i == 4 && global.player_dead_4) {
                continue;  // Skip creating the attack button for Player 4 if dead
            }

            // Determine the corresponding attack script
            var attack_script = asset_get_index("attack_p" + string(i));

            // Create the button dynamically with the text, action, and font size
            create_button("P" + string(i), current_x, start_y, button_width, button_height, "P" + string(i), attack_script);  // Adjust the font size as needed

            // Move to the right for the next button
            current_x += button_width + button_spacing;
        }
    }

    // Add a "Cancel" button to close the attack options, with font size
    create_button("Cancel", current_x, start_y, button_width, button_height, "Cancel", close_attack_options);
}
