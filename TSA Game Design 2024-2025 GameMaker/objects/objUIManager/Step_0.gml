// Step Event of UI Manager (for when the player is touching their corresponding unit generator and presses E)
if (!global.doingsomething) {
  if (global.colliding == true && global.currentplayer.resources >= global.unit_cost){	
   if (keyboard_check_released(ord("E"))) {

            global.doingsomething = true;

            // Header button with larger font size for visibility
            create_button("Header", 20, 420, 300, 40, "Select Unit Type", does_nothing);

            // Attacker and Gatherer buttons
            create_button("Attacker", 20, 470, 140, 50, "Attacker", function() {
                clear_unit_selection_ui();
                create_attacker();
            });
            
            create_button("Gatherer", 160, 470, 140, 50, "Gatherer", function() {
                clear_unit_selection_ui();
                create_gatherer();
            });
        }
    } 
}
