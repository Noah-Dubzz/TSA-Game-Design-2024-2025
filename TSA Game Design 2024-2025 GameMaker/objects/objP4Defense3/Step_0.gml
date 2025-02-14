// --------- Upgrade and Activation Logic ---------
// Check if it's player 2's turn, if the player is near this defense, and if they pressed "E" to upgrade.
if (global.currentplayer == objP4 && place_meeting(x, y, objP4) && keyboard_check_pressed(ord("E"))) {
    // Calculate cost based on current upgrades.
    var cost = upgrade_cost * (1 + upgrades);
    if (objP4.resources >= cost) {
        objP4.resources -= cost;
        upgrades += 1;
		hp = 100;
        active = true;  // Activate defense once upgraded.
    }
}

// --------- Firing and Targeting Logic ---------
if (active) {
    // Increment our firing timer every step.
    fire_timer++;

    // Calculate current fire rate and damage (upgrades improve both).
    // We now reduce fire rate by 5 per upgrade, with a minimum delay of 20 frames.
    var current_fire_rate = max(base_fire_rate - (upgrades * 5), 20);
    var current_damage = base_damage + upgrades * 0.25;

    // Target Acquisition (same as before)
    if (!instance_exists(current_target) || point_distance(x, y, current_target.x, current_target.y) > detection_range) {
        current_target = noone;  // Reset target

        var closest_dist = detection_range;
        var count = instance_number(objUnit);
        for (var i = 0; i < count; i++) {
            var unit = instance_find(objUnit, i);
            if (unit.owner != objP4) { // Only target enemy units
                var d = point_distance(x, y, unit.x, unit.y);
                if (d < closest_dist) {
                    closest_dist = d;
                    current_target = unit;
                }
            }
        }
    }

// Instant-Hit Attack
if (instance_exists(current_target) && point_distance(x, y, current_target.x, current_target.y) <= detection_range) {
    if (fire_timer >= current_fire_rate) {
        // Apply damage to the target.
        current_target.hp -= current_damage;

        // Create the muzzle flash effect at the top of the object.
        instance_create_layer(x, bbox_top, "UI", objDefenseFlash);

        // Reset the fire timer.
        fire_timer = 0;
    }
}

}
