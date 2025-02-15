audio_stop_all();
audio_play_sound(sndWin, 1, false);

// Check if the winner is P1
if (global.winner == 1) {
    if (global.p1character == 1) {
        sprite_index = sprTheBlurWin;
    }
    if (global.p1character == 2) {
        sprite_index = sprBlamesBlondeWin;
    }
    if (global.p1character == 3) {
        sprite_index = sprTheApexWin;
    }
    if (global.p1character == 4) {
        sprite_index = sprTheWandererWin;
    }
}

// Check if the winner is P2
if (global.winner == 2) {
    if (global.p2character == 1) {
        sprite_index = sprTheBlurWin;
    }
    if (global.p2character == 2) {
        sprite_index = sprBlamesBlondeWin;
    }
    if (global.p2character == 3) {
        sprite_index = sprTheApexWin;
    }
    if (global.p2character == 4) {
        sprite_index = sprTheWandererWin;
    }
}

// Check if the winner is P3
if (global.winner == 3) {
    if (global.p3character == 1) {
        sprite_index = sprTheBlurWin;
    }
    if (global.p3character == 2) {
        sprite_index = sprBlamesBlondeWin;
    }
    if (global.p3character == 3) {
        sprite_index = sprTheApexWin;
    }
    if (global.p3character == 4) {
        sprite_index = sprTheWandererWin;
    }
}

// Check if the winner is P4
if (global.winner == 4) {
    if (global.p4character == 1) {
        sprite_index = sprTheBlurWin;
    }
    if (global.p4character == 2) {
        sprite_index = sprBlamesBlondeWin;
    }
    if (global.p4character == 3) {
        sprite_index = sprTheApexWin;
    }
    if (global.p4character == 4) {
        sprite_index = sprTheWandererWin;
    }
}
