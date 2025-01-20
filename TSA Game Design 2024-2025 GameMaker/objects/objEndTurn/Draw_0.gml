// objEndTurn: Draw Event

// Ensure only the current turn sprite is drawn
switch (global.CurrentTurn) {
    case 1:
        draw_sprite(sprTurn1, 0, 0, 0); // Draw Turn 1 sprite
        break;
    case 2:
        draw_sprite(sprTurn2, 0, 0, 0); // Draw Turn 2 sprite
        break;
    case 3:
        draw_sprite(sprTurn3, 0, 0, 0); // Draw Turn 3 sprite
        break;
    case 4:
        draw_sprite(sprTurn4, 0, 0, 0); // Draw Turn 4 sprite
        break;
    default:
        // Fallback (optional): Display nothing if global.CurrentTurn is out of range
        break;
}
