// Ensure the correct number of player instances are present
var current_players = instance_number(objPlayer1) + instance_number(objPlayer2) + instance_number(objPlayer3) + instance_number(objPlayer4);

if (current_players < global.player_count) {
    switch (current_players + 1) { // Use the next index to create the appropriate player
        case 1:
            var player1 = instance_create_layer(0, 672, "Instances", objPlayer1);
            player1.image_xscale = 5;
            player1.image_yscale = 1;
            break;
        case 2:
            var player2 = instance_create_layer(352, 672, "Instances", objPlayer2);
            player2.image_xscale = 5;
            player2.image_yscale = 1;
            break;
        case 3:
            var player3 = instance_create_layer(704, 672, "Instances", objPlayer3);
            player3.image_xscale = 5;
            player3.image_yscale = 1;
            break;
        case 4:
            var player4 = instance_create_layer(1056, 672, "Instances", objPlayer4);
            player4.image_xscale = 5;
            player4.image_yscale = 1;
            break;
    }
}

// Remove players if needed
if (current_players > global.player_count) {
    with (objPlayer4) if (global.player_count < 4) instance_destroy();
    with (objPlayer3) if (global.player_count < 3) instance_destroy();
    with (objPlayer2) if (global.player_count < 2) instance_destroy();
    with (objPlayer1) if (global.player_count < 1) instance_destroy();
}
