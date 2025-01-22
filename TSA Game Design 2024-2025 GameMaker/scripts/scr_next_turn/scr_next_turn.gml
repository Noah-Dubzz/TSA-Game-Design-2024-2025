// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_next_turn(){
global.CurrentTurn += 1; // Move to the next player's turn

// If the turn exceeds the total number of players, reset it to 1
if (global.CurrentTurn > global.amountofplayers) {
    global.CurrentTurn = 1;
}

// Optional: You can add logic here if you need something specific to happen
// when a new turn begins (e.g., reset player actions, display notifications, etc.)
global.Lead = objTheApex;

}