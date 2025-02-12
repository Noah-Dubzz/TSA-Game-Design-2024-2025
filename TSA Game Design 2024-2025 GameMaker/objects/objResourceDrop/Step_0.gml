// Check if a player is overlapping this drop (assuming your player object is "objPlayer")
if (place_meeting(x, y, global.currentplayer)) {
    
    // Check if the player pressed E this step
    if (keyboard_check_pressed(ord("E"))) {
        press_count += 1;
        
        /// @NOTE: Insert your sound effect code here
        // For example: audio_play_sound(snd_press, 1, false);
        
        // If the drop has been pressed 3 times...
        if (press_count >= 3) {
            // Find the nearest player instance to award the resource
            var player_inst = instance_nearest(x, y, global.currentplayer);
            if (instance_exists(player_inst)) {
                // Ensure the player has a "resources" variable; if not, initialize it
                if (!variable_instance_exists(player_inst, "resources")) {
                    player_inst.resources = 0;
                }
                player_inst.resources += 5;
            }
            
            // Remove the drop
            instance_destroy();
        }
    }
}
