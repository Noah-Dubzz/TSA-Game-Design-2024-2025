/// @description Update dynamic music state and perform smooth crossfade transitions

// Ensure music system variables are initialized
if (!variable_global_exists("current_music")) global.current_music = noone;
if (!variable_global_exists("current_inst")) global.current_inst = noone;
if (!variable_global_exists("new_inst")) global.new_inst = noone;
if (!variable_global_exists("transitioning")) global.transitioning = false;
if (!variable_global_exists("transition_timer")) global.transition_timer = 0;
if (!variable_global_exists("fade_duration")) global.fade_duration = 60; // Adjust as needed

// -------------------------------
// 1. Determine the desired music track for the current turn:

// Decide the state using the global flags.
var state = "default";
if (global.underattack && global.gettingresources) {
    state = "both";
} else if (global.underattack) {
    state = "underattack";
} else if (global.gettingresources) {
    state = "gettingresources";
}

// Determine which player's turn it is using global.currentturn
var character = -1;
switch(global.currentturn) {
    case 1: character = global.p1character; break;
    case 2: character = global.p2character; break;
    case 3: character = global.p3character; break;
    case 4: character = global.p4character; break;
}
if (character == -1) { // If unassigned, default to The Apex (3)
    character = 3;
}

// Map the character number to its string identifier.
var charStr = "";
switch(character) {
    case 1: charStr = "blur";     break;
    case 2: charStr = "blames";   break;
    case 3: charStr = "apex";     break;
    case 4: charStr = "wanderer"; break;
    default: charStr = "apex";     break;
}

// Get the asset index for the desired music track
var desired_music = asset_get_index("snd_" + state + "_" + charStr);

// -------------------------------
// 2. Check if we need to change tracks (and we're not already transitioning)
if (desired_music != global.current_music && !global.transitioning) {
    global.transitioning = true;
    global.transition_timer = 0;
    global.new_music = desired_music;
    
    // Capture the current playback position to sync the new track.
    var pos = 0;
    if (audio_is_playing(global.current_inst)) {
        pos = audio_sound_get_track_position(global.current_inst);
    }
    
    // Start the new track in loop mode at zero volume.
    global.new_inst = audio_play_sound(global.new_music, 1, true);
    audio_sound_set_track_position(global.new_inst, pos); // Synchronize playback position
    audio_sound_gain(global.new_inst, 0, 0); // Set initial volume to 0
}

// -------------------------------
// 3. Process the crossfade transition if one is in progress.
if (global.transitioning) {
    global.transition_timer += 1;
    var t = global.transition_timer / global.fade_duration;
    if (t > 1) { t = 1; }

    // Ensure current instance is valid before modifying its gain
    if (audio_is_playing(global.current_inst)) {
        audio_sound_gain(global.current_inst, 1 - t, 0);
    }

    // Ensure new instance is valid before modifying its gain
    if (audio_is_playing(global.new_inst)) {
        audio_sound_gain(global.new_inst, t, 0);
    }

    // Complete the transition when the fade duration has elapsed.
    if (global.transition_timer >= global.fade_duration) {
        if (audio_is_playing(global.current_inst)) {
            audio_stop_sound(global.current_inst);
        }
        global.current_inst = global.new_inst;
        global.current_music = global.new_music;
        global.transitioning = false;
    }
}

// -------------------------------
// 4. Handle manual looping to avoid silent gaps.
if (audio_is_playing(global.current_inst)) {
    var pos = audio_sound_get_track_position(global.current_inst);

    // Define the loop points (adjust these values based on the actual loop points of your tracks)
    var loop_start = 0;   // Where the loop should restart (in seconds)
    var loop_end = 5.33;    // Where the loop should restart (before silence starts)

    // If track reaches the silent gap, reset to the loop start
    if (pos >= loop_end) {
        audio_sound_set_track_position(global.current_inst, loop_start);
    }
}
