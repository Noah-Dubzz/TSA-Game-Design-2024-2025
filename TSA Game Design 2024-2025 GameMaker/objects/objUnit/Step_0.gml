// objUnit Step Event

if (owner != global.currentplayer) {
    // Target priority order
    var target_order = [
        instance_find(asset_get_index("objP" + string(target) + "Defense1"), 0),
        instance_find(asset_get_index("objP" + string(target) + "Defense2"), 0),
        instance_find(asset_get_index("objP" + string(target) + "Defense3"), 0),
        instance_find(asset_get_index("objP" + string(target) + "UnitGenerator"), 0),
        instance_find(asset_get_index("objP" + string(target) + "Base"), 0),
        instance_find(asset_get_index("objP" + string(target)), 0)
    ];

    // Move speed
    var move_speed = 4;

    // Damage timer
    if (!variable_instance_exists(id, "damage_timer")) damage_timer = 0;
    damage_timer += delta_time / 1000000; // Convert to seconds

    // Iterate through target priority
    for (var i = 0; i < array_length(target_order); i++) {
        var current_target = target_order[i];

        if (instance_exists(current_target)) {
            // Move towards the current target
            move_towards_point(current_target.x, current_target.y, move_speed);

            // Apply damage when within range every 3 seconds
            if (point_distance(x, y, current_target.x, current_target.y) <= 4) {
                if (damage_timer >= 3) {
                    current_target.hp -= damage;
                    damage_timer = 0;

                    // Destroy the target if HP is zero or below
                    if (current_target.hp <= 0) {
                        instance_destroy(current_target);
                    }
                }
            }

            // Stop checking further targets until this one is destroyed
            break;
        }
    }

    // Check if all targets are destroyed
    var all_destroyed = true;
    for (var j = 0; j < array_length(target_order); j++) {
        if (instance_exists(target_order[j])) {
            all_destroyed = false;
            break;
        }
    }
	
// Convert units to resources if target player is fully destroyed
// Check if all targets are destroyed
if (all_destroyed) {
    // Add resources to the owner's resource count
    var player_obj = asset_get_index("objP" + string(owner));  // Use 'owner' here to add resources to the correct player
    var player_instance = instance_find(player_obj, 0); // Find the first instance of the owner player

    if (instance_exists(player_instance)) {
        // Ensure 'resources' exists
        if (!variable_instance_exists(player_instance, "resources")) {
            player_instance.resources = 0;
        }
        player_instance.resources += 5;  // Add 5 resources to the owner
    } else {
        show_debug_message("Error: Player instance not found for owner " + string(owner));
    }

    // Update the global variable to track the target player's death (using individual flags)
    if (target == 1) {
        global.player_dead_1 = true;
    } else if (target == 2) {
        global.player_dead_2 = true;
    } else if (target == 3) {
        global.player_dead_3 = true;
    } else if (target == 4) {
        global.player_dead_4 = true;
    }

    instance_destroy();
}








}



//unit_instance.owner = argument2;   // Assign the owner
//unit_instance.type = argument3;    // Assign the type
//unit_instance.target = argument4;  // Assign the target
//unit_instance.hp = argument5;  // Assign the hp
//unit_instance.damage = argument6;  // Assign the damage