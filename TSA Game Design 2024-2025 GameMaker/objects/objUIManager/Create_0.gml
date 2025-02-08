/// objUIManager - Create Event

// Global Variables
if (!variable_global_exists("currentturn")) global.currentturn = 1; // Starting with Player 1
if (!variable_global_exists("ui_state")) global.ui_state = "default"; // Default UI state

// Player Data (Example for 4 Players)
global.players = [
    {resources: 10, base_health: 50},
    {resources: 10, base_health: 50},
    {resources: 10, base_health: 50},
    {resources: 10, base_health: 50}
];

// UI Button Definitions
ui_buttons = [
    {x: 900, y: 500, w: 80, h: 40, label: "End Turn", action: function() {
        global.currentturn = (global.currentturn % 4) + 1;
        global.ui_state = "default";
    }}
];

// UI States
global.unit_buttons = [];
global.attack_buttons = [];