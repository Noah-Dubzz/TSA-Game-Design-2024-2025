// In the UI Manager's Step Event (when the player is touching the unit generator and presses E)
if (global.player_is_touching_unit_generator && keyboard_check_released(ord("E"))) {
    create_button("Header", 20, 420, 300, 40, "Select Unit Type", does_nothing);  
    
    // Wrap create_attacker and create_gatherer inside anonymous functions to clear UI first
    create_button("Attacker", 20, 470, 140, 50, "Attacker", function() {
        clear_unit_selection_ui();
        create_attacker();
    });
    
    create_button("Gatherer", 160, 470, 140, 50, "Gatherer", function() {
        clear_unit_selection_ui();
        create_gatherer();
    });
}