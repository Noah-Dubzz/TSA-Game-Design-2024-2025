/// objUIManager - Step Event

// Input Handling
if (keyboard_check_pressed(ord("E"))) {
    if (place_meeting(objPlayer.x, objPlayer.y, objUnitGenerator)) {
        global.ui_state = (global.ui_state == "unit_creation") ? "default" : "unit_creation";
    }
}

// Mouse Input Handling for Buttons
for (var i = 0; i < array_length(ui_buttons); i++) {
    var btn = ui_buttons[i];
    if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, btn.x, btn.y, btn.x + btn.w, btn.y + btn.h)) {
        btn.action();
    }
}

// Dynamic Button Logic
if (global.ui_state == "unit_creation" && global.unit_buttons == []) {
    global.unit_buttons = [
        {sprite: sprWhatKind, x: 640, y: 164},
        {sprite: sprResourceType, x: 300, y: 164},
        {sprite: sprAttackType, x: 300, y: 328}
    ];
} else if (global.ui_state != "unit_creation") {
    global.unit_buttons = [];
}

if (global.ui_state == "attack_menu" && global.attack_buttons == []) {
    global.attack_buttons = [
        {sprite: sprAttackP1, x: 300, y: 164},
        {sprite: sprAttackP2, x: 300, y: 328},
        {sprite: sprAttackP3, x: 300, y: 492},
        {sprite: sprAttackP4, x: 300, y: 656}
    ];
} else if (global.ui_state != "attack_menu") {
    global.attack_buttons = [];
}