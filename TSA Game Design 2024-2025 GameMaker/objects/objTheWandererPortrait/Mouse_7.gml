// Transition to the character select room for all players

// Player 1 selection
if (room == rmPlayer1Select && global.amountofplayers > 1) {
    global.p1character = 4; // Assign Player 1 character
    room_goto(rmPlayer2Select); // Go to Player 2 selection
}

// Player 2 selection
if (room == rmPlayer2Select && global.amountofplayers > 2) {
    global.p2character = 4; // Assign Player 2 character
    room_goto(rmPlayer3Select); // Go to Player 3 selection
} else if (room == rmPlayer2Select && global.amountofplayers == 2) {
    global.p2character = 4; // Assign Player 2 character
    room_goto(rmGame); // Go directly to the game if only 2 players
}

// Player 3 selection
if (room == rmPlayer3Select && global.amountofplayers > 3) {
    global.p3character = 4; // Assign Player 3 character
    room_goto(rmPlayer4Select); // Go to Player 4 selection
} else if (room == rmPlayer3Select && global.amountofplayers == 3) {
    global.p3character = 4; // Assign Player 3 character
    room_goto(rmGame); // Go directly to the game if only 3 players
}

// Player 4 selection
if (room == rmPlayer4Select && global.amountofplayers == 4) {
    global.p4character = 4; // Assign Player 4 character
    room_goto(rmGame); // Transition to the game room
}
