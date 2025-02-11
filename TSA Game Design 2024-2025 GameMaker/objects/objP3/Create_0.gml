//If there's only 2 players, I die
if (global.amountofplayers = 2){
	instance_destroy(self);
}

if (global.amountofplayers >= 3){
// Initialize resources for Player 1
resources = 10;  // Set starting resources
hp = 100;  // Example hp value (adjust as necessary)

// Set character sprites based on Player 1's selected character
switch (global.p3character) {
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
        // Player 1 selected character 2 (Blames)
        sprite_indexLeft = sprBlamesLeft;
        sprite_indexRight = sprBlamesRight;
        sprite_indexUp = sprBlamesUp;
        sprite_indexDown = sprBlamesDown;
        sprite_indexUpLeft = sprBlamesUpLeft;
        sprite_indexUpRight = sprBlamesUpRight;
        sprite_indexDownLeft = sprBlamesDownLeft;
        sprite_indexDownRight = sprBlamesDownRight;
        sprite_indexIdle = sprBlamesIdle;
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
        // Player 1 selected character 4 (Wanderer)
        sprite_indexLeft = sprWandererLeft;
        sprite_indexRight = sprWandererRight;
        sprite_indexUp = sprWandererUp;
        sprite_indexDown = sprWandererDown;
        sprite_indexUpLeft = sprWandererUpLeft;
        sprite_indexUpRight = sprWandererUpRight;
        sprite_indexDownLeft = sprWandererDownLeft;
        sprite_indexDownRight = sprWandererDownRight;
        sprite_indexIdle = sprWandererIdle;
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