// Initialize global variables
global.amountofplayers = 2;       // Set the number of players to 2
global.character1 = -1;           // Set Player 1's character to an unassigned state (-1)
global.character2 = -1;           // Set Player 2's character to an unassigned state (-1)
global.character3 = -1;           // Set Player 3's character to an unassigned state (-1)
global.character4 = -1;           // Set Player 4's character to an unassigned state (-1)
global.currentturn = 1;           // Set the starting turn to Player 1
global.doingsomething = false;    // Initialize the action flag (false means not doing anything)
global.unit_cost = 5;              // Sets the amount of resources it costs to make a unit
global.currentplayer = objP1;
global.currentgenerator = objP1UnitGenerator;
global.colliding = false;
// Initialize global player dead status in the Create Event of objGameManager
global.player_dead_1 = false;
global.player_dead_2 = false;
global.player_dead_3 = false;
global.player_dead_4 = false;
