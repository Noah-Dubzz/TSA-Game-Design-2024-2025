// Step Event of UI Manager (for when the player is touching the unit generator and presses E)

if (global.player_is_touching_unit_generator && keyboard_check_released(ord("E"))) {
    // Header button with larger font size for visibility
    create_button("Header", 20, 420, 300, 40, "Select Unit Type", does_nothing);  // Larger font for header

    // Attacker and Gatherer buttons with font size 24
    create_button("Attacker", 20, 470, 140, 50, "Attacker", function() {
        clear_unit_selection_ui();
        create_attacker();
    });
    
    create_button("Gatherer", 160, 470, 140, 50, "Gatherer", function() {
        clear_unit_selection_ui();
        create_gatherer();
    });
}
