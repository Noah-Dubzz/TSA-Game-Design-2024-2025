/// objUIManager - Draw GUI Event

// Draw Resource Display
for (var i = 0; i < 4; i++) {
    draw_text(20, 20 + (i * 30), "P" + string(i+1) + " Resources: " + string(global.players[i].resources));
    draw_text(180, 20 + (i * 30), "Base HP: " + string(global.players[i].base_health));
}

// Draw Current Turn Indicator
draw_text(450, 20, "Current Turn: Player " + string(global.currentturn));

// Draw UI Buttons
for (var i = 0; i < array_length(ui_buttons); i++) {
    var btn = ui_buttons[i];
    draw_set_color(c_black);
    draw_rectangle(btn.x, btn.y, btn.x + btn.w, btn.y + btn.h, false);
    draw_set_color(c_white);
    draw_text(btn.x + 10, btn.y + 10, btn.label);
}

// Draw Unit Creation Buttons
for (var i = 0; i < array_length(global.unit_buttons); i++) {
    var unit_btn = global.unit_buttons[i];
    draw_sprite(unit_btn.sprite, 0, unit_btn.x, unit_btn.y);
}

// Draw Attack Menu Buttons
for (var i = 0; i < array_length(global.attack_buttons); i++) {
    var attack_btn = global.attack_buttons[i];
    draw_sprite(attack_btn.sprite, 0, attack_btn.x, attack_btn.y);
} 

// Dynamic UI State Handling
switch (global.ui_state) {
    case "default":
        // No additional UI in default state
        break;
    case "unit_creation":
        draw_text(600, 100, "Unit Creation Mode");
        break;
    case "attack_menu":
        draw_text(600, 100, "Attack Menu");
        break;
} 