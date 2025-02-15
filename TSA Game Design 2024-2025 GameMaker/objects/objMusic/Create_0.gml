/// @description Initialize dynamic music system variables

// Variables to track current music state
current_music   = noone;  // The asset index of the current music track
current_inst    = noone;  // The audio instance id of the currently playing sound

// Variables used for crossfade transitions
transitioning    = false;  // Flag to indicate if a crossfade is in progress
transition_timer = 0;      // Timer for the crossfade (in steps)
fade_duration    = 30;     // Duration (in steps) of the crossfade (adjust as needed)
new_music        = noone;  // Asset index for the new track during transition
new_inst         = noone;  // Audio instance id for the new track

// -------------------------------
// 1. Determine the current music state based on global flags
var state = "default";
if (global.underattack && global.gettingresources) {
    state = "both";
} else if (global.underattack) {
    state = "underattack";
} else if (global.gettingresources) {
    state = "gettingresources";
}

// -------------------------------
// 2. Determine the current player's character based on turn.
var character = -1;
switch(global.currentturn) {
    case 1: character = global.p1character; break;
    case 2: character = global.p2character; break;
    case 3: character = global.p3character; break;
    case 4: character = global.p4character; break;
}

// Ensure a valid character selection
if (character == -1) {
    character = 3; // Default to The Apex
}

// Map the character number to a string tag.
var charStr = "";
switch(character) {
    case 1: charStr = "blur";     break;
    case 2: charStr = "blames";   break;
    case 3: charStr = "apex";     break;
    case 4: charStr = "wanderer"; break;
    default: charStr = "apex";     break;
}

// -------------------------------
// 3. Get the asset index for the starting music track (but don't play it yet)
current_music = asset_get_index("snd_" + state + "_" + charStr);

// Let the Step Event handle actual playback
current_inst = noone;
