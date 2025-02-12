with (objButton) {
    if (button_text == "Cancel" || button_text == "P1" || button_text == "P2" || button_text == "P3" || button_text == "P4") {
        instance_destroy();
		global.doingsomething = false;
    }
}