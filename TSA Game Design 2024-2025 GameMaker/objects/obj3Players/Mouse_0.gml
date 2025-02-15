// Set the number of players to 3
global.amountofplayers = 3;
audio_play_sound(sndButtonPress, 1, false);
// Transition to the character select room
room_goto(rmPlayer1Select);
global.lastroom = rmHowMany;
