// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_gatherer(){
   global.doingsomething = false;
   global.currentplayer.resources = global.currentplayer.resources - global.unit_cost;
   create_unit(global.currentgenerator.x, global.currentgenerator.y, global.currentplayer, "Gatherer", -1, 5, 20);  // Position, owner (player 1), target (Player 2), etc.
}