// Script: clear_unit_selection_ui

// Destroy all instances of objButton related to unit selection
with (objButton) {
    if (button_text == "Select Unit Type" || button_text == "Attacker" || button_text == "Gatherer") {
        instance_destroy();
    }
}
