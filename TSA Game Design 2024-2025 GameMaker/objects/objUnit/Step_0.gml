// Allow movement only if it's the owner's turn
if (player_turn == owner) {  
    if (target != noone) { 
        move_towards_point(target.x, target.y, speed);
    }
}
