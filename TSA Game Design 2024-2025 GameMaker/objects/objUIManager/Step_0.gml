// In the UI Manager's Step Event (when the player is touching the unit generator and presses E)
if (global.player_is_touching_unit_generator && keyboard_check_released(ord("E"))) {
    // Create the "Select Unit Type" header (scaled properly)
    create_button("Header", 20, 420, 300, 40, "Select Unit Type", does_nothing);  // Wider but shorter header
    
    // Create an "Attacker" button next to the "Gatherer" button
    create_button("Attacker", 20, 470, 140, 50, "Attacker", create_attacker);  // Sized and positioned appropriately
    
    // Create a "Gatherer" button next to the "Attacker" button
    create_button("Gatherer", 160, 470, 140, 50, "Gatherer", create_gatherer);  // Positioned next to the "Attacker"
}
