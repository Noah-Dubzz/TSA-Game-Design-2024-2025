// Step Event of UI Manager (for when the player is touching their corresponding unit generator and presses E)
if (!global.doingsomething) {
  if (global.colliding == true && global.currentplayer.resources >= global.unit_cost){	
   if (keyboard_check_released(ord("E"))) {
			audio_play_sound(sndButtonPress, 1, false);

            global.doingsomething = true;

            // Header button with larger font size for visibility
            create_button("Header", 5, 450, 290, 40, "Select Unit Type", does_nothing);

            // Attacker and Gatherer buttons
            create_button("Attacker", 5, 500, 150, 50, "Attacker", function() {
                clear_unit_selection_ui();
                create_attacker();
            });
            
            create_button("Gatherer", 145, 500, 150, 50, "Gatherer", function() {
                clear_unit_selection_ui();
                create_gatherer();
            });
        }
    } 
}
