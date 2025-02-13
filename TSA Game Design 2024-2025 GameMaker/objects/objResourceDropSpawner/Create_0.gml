// Define candidate spawn centers (focusing on the central regions)
// Adjust these numbers as needed for your bases (assuming a 5000 x 5000 map)
spawn_centers = [
    [2500, 2500], // Center
    [1250, 2500], // Middle Left
    [3750, 2500], // Middle Right
    [2500, 1250], // Top Middle
    [2500, 3750]  // Bottom Middle
];

// Initial spawn timer (in steps). For example, 300 steps (~5 seconds at 60fps)
spawn_timer = 300;

// At game start, spawn a few initial drops (for example, 3 drops)
for (var i = 0; i < 3; i++) {
    // Only spawn if we’re below 15 drops
    if (instance_number(objResourceDrop) < 15) {
        var index = irandom(array_length(spawn_centers) - 1);
        var center = spawn_centers[index];
        
        // Add a random offset (e.g., ±200 pixels), avoiding corners
        var drop_x = center[0] + random_range(-200, 200);
        var drop_y = center[1] + random_range(-200, 200);
        
        // Ensure the drop isn't in a corner (assuming 200x200 corner zones)
        if (!((drop_x < 200 && drop_y < 200) || (drop_x > 4800 && drop_y < 200) ||
              (drop_x < 200 && drop_y > 4800) || (drop_x > 4800 && drop_y > 4800))) {
            instance_create_layer(drop_x, drop_y, "Instances", objResourceDrop);
        }
    }
}
