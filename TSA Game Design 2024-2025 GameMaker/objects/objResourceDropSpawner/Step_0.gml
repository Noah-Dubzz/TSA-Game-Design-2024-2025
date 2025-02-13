// Only spawn new drops if there are fewer than 15 instances
if (instance_number(objResourceDrop) < 15) {
    
    // Decrease the timer every step
    spawn_timer -= 1;
    
    // When the timer reaches 0, spawn a new drop
    if (spawn_timer <= 0) {
        // Choose a random candidate spawn center
        var index = irandom(array_length(spawn_centers) - 1);
        var center = spawn_centers[index];
        
        // Random offset so the drops aren’t exactly on the center point
        var drop_x = center[0] + random_range(-200, 200);
        var drop_y = center[1] + random_range(-200, 200);
        
        // Ensure the drop isn't in a corner (assuming 200x200 corner zones)
        if (!((drop_x < 200 && drop_y < 200) || (drop_x > 4800 && drop_y < 200) ||
              (drop_x < 200 && drop_y > 4800) || (drop_x > 4800 && drop_y > 4800))) {
            instance_create_layer(drop_x, drop_y, "Instances", objResourceDrop);
        }
        
        // Reset the spawn timer based on the current turn.
        // The higher global.currentturn is, the shorter the interval (but not below 60 steps).
        // Adjust the numbers as needed for your desired pacing.
        spawn_timer = max(300 - (global.currentturn - 1) * 10, 60);
    }
}
