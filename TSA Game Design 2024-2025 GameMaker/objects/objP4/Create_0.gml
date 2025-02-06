// Only execute this code if there are 4 players
if (global.amountofplayers == 4){
// Initialize resources for Player 1
resources = 10;  // Set starting resources

// Set character sprites based on Player 1's selected character
switch (global.p4character) {
    case 1:
        // Player 1 selected character 1 (Blur)
        sprite_indexLeft = sprBlurLeft;
        sprite_indexRight = sprBlurRight;
        sprite_indexUp = sprBlurUp;
        sprite_indexDown = sprBlurDown;
        sprite_indexUpLeft = sprBlurUpLeft;
        sprite_indexUpRight = sprBlurUpRight;
        sprite_indexDownLeft = sprBlurDownLeft;
        sprite_indexDownRight = sprBlurDownRight;
        sprite_indexIdle = sprBlurIdle;
        break;
        
    case 2:
        // Player 1 selected character 2 (Blur)
        sprite_indexLeft = sprBlurLeft;
        sprite_indexRight = sprBlurRight;
        sprite_indexUp = sprBlurUp;
        sprite_indexDown = sprBlurDown;
        sprite_indexUpLeft = sprBlurUpLeft;
        sprite_indexUpRight = sprBlurUpRight;
        sprite_indexDownLeft = sprBlurDownLeft;
        sprite_indexDownRight = sprBlurDownRight;
        sprite_indexIdle = sprBlurIdle;
        break;
        
    case 3:
        // Player 1 selected character 3 (Apex)
        sprite_indexLeft = sprApexLeft;
        sprite_indexRight = sprApexRight;
        sprite_indexUp = sprApexUp;
        sprite_indexDown = sprApexDown;
        sprite_indexUpLeft = sprApexUpLeft;
        sprite_indexUpRight = sprApexUpRight;
        sprite_indexDownLeft = sprApexDownLeft;
        sprite_indexDownRight = sprApexDownRight;
        sprite_indexIdle = sprApexIdle;
        break;
        
    case 4:
        // Player 1 selected character 4 (Blur)
        sprite_indexLeft = sprBlurLeft;
        sprite_indexRight = sprBlurRight;
        sprite_indexUp = sprBlurUp;
        sprite_indexDown = sprBlurDown;
        sprite_indexUpLeft = sprBlurUpLeft;
        sprite_indexUpRight = sprBlurUpRight;
        sprite_indexDownLeft = sprBlurDownLeft;
        sprite_indexDownRight = sprBlurDownRight;
        sprite_indexIdle = sprBlurIdle;
        break;
        
    default:
        // If no valid character is selected, fall back to Blur
        sprite_indexLeft = sprBlurLeft;
        sprite_indexRight = sprBlurRight;
        sprite_indexUp = sprBlurUp;
        sprite_indexDown = sprBlurDown;
        sprite_indexUpLeft = sprBlurUpLeft;
        sprite_indexUpRight = sprBlurUpRight;
        sprite_indexDownLeft = sprBlurDownLeft;
        sprite_indexDownRight = sprBlurDownRight;
        sprite_indexIdle = sprBlurIdle;
        break;
}

// Note: `default` case handles any unhandled character value by defaulting to Blur (could be useful for debugging)
}
//If there's not 4 players, why do I need to be here?
if (global.amountofplayers != 4){
	instance_destroy(self);
}