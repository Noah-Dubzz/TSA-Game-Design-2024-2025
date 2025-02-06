// objEndTurn: Draw Event

// Ensure only the current turn sprite is drawn
switch (global.currentturn) {
    case 1:
        draw_sprite(sprTurn1, 0, 0, 0);  // Draw Turn 1 sprite
        break;
    case 2:
        draw_sprite(sprTurn2, 0, 0, 0);  // Draw Turn 2 sprite
        break;
    case 3:
        draw_sprite(sprTurn3, 0, 0, 0);  // Draw Turn 3 sprite
        break;
    case 4:
        draw_sprite(sprTurn4, 0, 0, 0);  // Draw Turn 4 sprite
        break;
    default:
        // Fallback (optional): Display nothing or a default sprite
        // In case an unexpected value is encountered in global.currentturn
        break;
}

// Optional: Create End Turn button for the current player (if not already created elsewhere)
if (global.currentturn == 1 || global.currentturn == 2 || global.currentturn == 3 || global.currentturn == 4) {
    // Check if the button isn't already created
    if (!instance_exists(objEndTurn)) {
        instance_create_layer(980, 540, "UI", objEndTurn);  // Place the button
    }
}
