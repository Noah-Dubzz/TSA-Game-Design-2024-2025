// Draw GUI Event for objUIResources

// Determine the current player or the next alive player if the current is dead
var resource_count;

if (global.player_dead_1 && global.currentplayer == objP1) {
    // Player 1 is dead, show next alive player (cycle through)
    if (global.amountofplayers >= 2 && !global.player_dead_2) {
        resource_count = objP2.resources;
    } else if (global.amountofplayers >= 3 && !global.player_dead_3) {
        resource_count = objP3.resources;
    } else if (global.amountofplayers >= 4 && !global.player_dead_4) {
        resource_count = objP4.resources;
    }
} else if (global.player_dead_2 && global.currentplayer == objP2) {
    // Player 2 is dead, show next alive player (cycle through)
    if (global.amountofplayers >= 3 && !global.player_dead_3) {
        resource_count = objP3.resources;
    } else if (global.amountofplayers >= 4 && !global.player_dead_4) {
        resource_count = objP4.resources;
    } else if (global.amountofplayers >= 2 && !global.player_dead_1) {
        resource_count = objP1.resources;
    }
} else if (global.player_dead_3 && global.currentplayer == objP3) {
    // Player 3 is dead, show next alive player (cycle through)
    if (global.amountofplayers >= 4 && !global.player_dead_4) {
        resource_count = objP4.resources;
    } else if (global.amountofplayers >= 2 && !global.player_dead_1) {
        resource_count = objP1.resources;
    } else if (global.amountofplayers >= 3 && !global.player_dead_2) {
        resource_count = objP2.resources;
    }
} else if (global.player_dead_4 && global.currentplayer == objP4) {
    // Player 4 is dead, show Player 1's resources
    if (global.amountofplayers >= 2 && !global.player_dead_1) {
        resource_count = objP1.resources;
    } else if (global.amountofplayers >= 3 && !global.player_dead_2) {
        resource_count = objP2.resources;
    } else if (global.amountofplayers >= 4 && !global.player_dead_3) {
        resource_count = objP3.resources;
    }
} else {
    // Current player is alive, show their resources
    resource_count = global.currentplayer.resources;
}

// Display the resource count
draw_set_font(Medival);
draw_set_color(c_white);
draw_text(10, 10, "Resources: " + string(resource_count));  // Display resources at position (10, 10)
