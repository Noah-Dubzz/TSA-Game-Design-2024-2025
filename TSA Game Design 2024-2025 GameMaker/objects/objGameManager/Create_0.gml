/// @description Initialization of the turn-based game system

// Initialize global resources for each player
global.resources = [100, 100, 100, 100];  // Example: 100 resources for each of the 4 players

// Global Variables for Turn System
global.currentturn = 1;  // Player 1 starts the game
global.turnstate = "turn_start";  // Initial state when the turn starts
global.gameover = false;  // Flag to check if the game is over (optional)

// In objGameManager's Create Event or before you reference it in the Step Event
global.endturn = false;  // Initialize the endturn variable to false
// Create the End Turn button dynamically

// Turn Manager Initialization
// These global variables control the flow of the game turns
global.turnstate = "turn_start";  // The game starts in the 'turn_start' state
global.currentturn = 1;  // Player 1 starts their turn
global.gameover = false;  // The game is not over initially

// Optional: Setup additional global variables as needed for game state
// Example:
// global.resources = 100;  // A resource variable for each player
// global.max_turns = 10;  // Maximum number of turns before game over
