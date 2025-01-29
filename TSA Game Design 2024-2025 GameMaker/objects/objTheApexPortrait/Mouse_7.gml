// Transition to the character select room for all players
if (room == rmPlayer1Select && global.amountofplayers > 1) {
    global.p1character = 3; // Assign Player 1 character
    show_debug_message("Player 1 character assigned: " + string(global.p1character));
    show_debug_message("Moving to Player 2 select room...");
    room_goto(rmPlayer2Select); // Go to Player 2 selection
}

if (room == rmPlayer2Select && global.amountofplayers > 2) {
    global.p2character = 3; // Assign Player 2 character
    show_debug_message("Player 2 character assigned: " + string(global.p2character));
    show_debug_message("Moving to Player 3 select room...");
    room_goto(rmPlayer3Select); // Go to Player 3 selection
} else if (room == rmPlayer2Select && global.amountofplayers == 2) {
    global.p2character = 3; // Assign Player 2 character
    show_debug_message("Player 2 character assigned: " + string(global.p2character));
    show_debug_message("Only 2 players. Moving directly to game...");
    room_goto(rmGame); // Go directly to the game if only 2 players
}

if (room == rmPlayer3Select && global.amountofplayers > 3) {
    global.p3character = 3; // Assign Player 3 character
    show_debug_message("Player 3 character assigned: " + string(global.p3character));
    show_debug_message("Moving to Player 4 select room...");
    room_goto(rmPlayer4Select); // Go to Player 4 selection
} else if (room == rmPlayer3Select && global.amountofplayers == 3) {
    global.p3character = 3; // Assign Player 3 character
    show_debug_message("Player 3 character assigned: " + string(global.p3character));
    show_debug_message("Only 3 players. Moving directly to game...");
    room_goto(rmGame); // Go directly to the game if only 3 players
}

if (room == rmPlayer4Select && global.amountofplayers == 4) {
    global.p4character = 3; // Assign Player 4 character
    show_debug_message("Player 4 character assigned: " + string(global.p4character));
    show_debug_message("All players assigned. Starting the game...");
    room_goto(rmGame); // Transition to the game room
}
