// objUnit Step Event with Obstacle Avoidance

if (owner != global.currentplayer) {
    var target_order = [
        instance_find(asset_get_index("objP" + string(target) + "Defense1"), 0),
        instance_find(asset_get_index("objP" + string(target) + "Defense2"), 0),
        instance_find(asset_get_index("objP" + string(target) + "Defense3"), 0),
        instance_find(asset_get_index("objP" + string(target) + "UnitGenerator"), 0),
        instance_find(asset_get_index("objP" + string(target) + "Base"), 0),
        instance_find(asset_get_index("objP" + string(target)), 0)
    ];

    var base_move_speed = 4;
    var move_speed = base_move_speed + random_range(-1, 1);

    if (!variable_instance_exists(id, "damage_timer")) damage_timer = 0;
    damage_timer += delta_time / 1000000;

    var random_offset_x = random_range(-8, 8);
    var random_offset_y = random_range(-3, 3);

    for (var i = 0; i < array_length(target_order); i++) {
        var current_target = target_order[i];

        if (instance_exists(current_target)) {
            var target_x = current_target.x + random_offset_x;
            var target_y = current_target.y + random_offset_y;

            var avoidance_x = 0;
            var avoidance_y = 0;

            var nearby_units = ds_list_create();
            instance_place_list(x, y, objUnit, nearby_units, false);

            for (var u = 0; u < ds_list_size(nearby_units); u++) {
                var other_unit = nearby_units[| u];

                if (other_unit != id && other_unit.owner == owner && other_unit.target == target) {
                    var distance = point_distance(x, y, other_unit.x, other_unit.y);
                    if (distance < 10) {
                        var angle_to_other = point_direction(other_unit.x, other_unit.y, x, y);
                        avoidance_x += lengthdir_x(2, angle_to_other);
                        avoidance_y += lengthdir_y(2, angle_to_other);
                    }
                }
            }
            ds_list_destroy(nearby_units);

            target_x += avoidance_x;
            target_y += avoidance_y;

            // Obstacle Avoidance
            var dir = point_direction(x, y, target_x, target_y);
            var check_distance = move_speed + 4;
            
            if (collision_line(x, y, x + lengthdir_x(check_distance, dir), y + lengthdir_y(check_distance, dir), objWall, false, true)) {
                dir += random_range(-90, 90); // Adjust angle randomly to "slide" along the wall
            }

            var move_x = lengthdir_x(move_speed, dir);
            var move_y = lengthdir_y(move_speed, dir);

            if (!place_meeting(x + move_x, y, objWall)) x += move_x;
            if (!place_meeting(x, y + move_y, objWall)) y += move_y;

            if (point_distance(x, y, current_target.x, current_target.y) <= 4) {
                if (damage_timer >= 3) {
                    current_target.hp -= damage;
                    damage_timer = 0;
                    if (current_target.hp <= 0) instance_destroy(current_target);
                }
            }
            break;
        }
    }

    var all_destroyed = true;
    for (var j = 0; j < array_length(target_order); j++) {
        if (instance_exists(target_order[j])) {
            all_destroyed = false;
            break;
        }
    }

    // Convert units to resources if target player is fully destroyed
    if (all_destroyed) {
        var player_obj = asset_get_index("objP" + string(owner));  // Use 'owner' here to add resources to the correct player
        var player_instance = instance_find(player_obj, 0); // Find the first instance of the owner player

        if (instance_exists(player_instance)) {
            // Ensure 'resources' exists
            if (!variable_instance_exists(player_instance, "resources")) {
                player_instance.resources = 0;
            }
            player_instance.resources += global.unit_cost;  // restore resources to the owner
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


// Set the sprite based on the owner and character type

// Player 1
if (owner == objP1) {
    if (global.p1character == 1) {
        if (type == "Attacker") {
            sprite_index = sprBlUnit1; // Player 1, Attacker sprite
        }
        if (type == "Gatherer") {
            sprite_index = sprBlUnit2; // Player 1, Gatherer sprite
        }
    }
    if (global.p1character == 2) {
        if (type == "Attacker") {
            sprite_index = sprBBUnit1; // Player 1, Attacker sprite
        }
        if (type == "Gatherer") {
            sprite_index = sprBBUnit2; // Player 1, Gatherer sprite
        }
    }
    if (global.p1character == 3) {
        if (type == "Attacker") {
            sprite_index = sprAXUnit1; // Player 1, Attacker sprite
        }
        if (type == "Gatherer") {
            sprite_index = sprAXUnit2; // Player 1, Gatherer sprite
        }
    }
    if (global.p1character == 4) {
        if (type == "Attacker") {
            sprite_index = sprWRUnit1; // Player 1, Attacker sprite
        }
        if (type == "Gatherer") {
            sprite_index = sprWRUnit2; // Player 1, Gatherer sprite
        }
    }
}

// Player 2
if (owner == objP2) {
    if (global.p2character == 1) {
        if (type == "Attacker") {
            sprite_index = sprBlUnit1; // Player 2, Attacker sprite
        }
        if (type == "Gatherer") {
            sprite_index = sprBlUnit2; // Player 2, Gatherer sprite
        }
    }
    if (global.p2character == 2) {
        if (type == "Attacker") {
            sprite_index = sprBBUnit1; // Player 2, Attacker sprite
        }
        if (type == "Gatherer") {
            sprite_index = sprBBUnit2; // Player 2, Gatherer sprite
        }
    }
    if (global.p2character == 3) {
        if (type == "Attacker") {
            sprite_index = sprAXUnit1; // Player 2, Attacker sprite
        }
        if (type == "Gatherer") {
            sprite_index = sprAXUnit2; // Player 2, Gatherer sprite
        }
    }
    if (global.p2character == 4) {
        if (type == "Attacker") {
            sprite_index = sprWRUnit1; // Player 2, Attacker sprite
        }
        if (type == "Gatherer") {
            sprite_index = sprWRUnit2; // Player 2, Gatherer sprite
        }
    }
}

// Player 3
if (owner == objP3) {
    if (global.p3character == 1) {
        if (type == "Attacker") {
            sprite_index = sprBlUnit1; // Player 3, Attacker sprite
        }
        if (type == "Gatherer") {
            sprite_index = sprBlUnit2; // Player 3, Gatherer sprite
        }
    }
    if (global.p3character == 2) {
        if (type == "Attacker") {
            sprite_index = sprBBUnit1; // Player 3, Attacker sprite
        }
        if (type == "Gatherer") {
            sprite_index = sprBBUnit2; // Player 3, Gatherer sprite
        }
    }
    if (global.p3character == 3) {
        if (type == "Attacker") {
            sprite_index = sprAXUnit1; // Player 3, Attacker sprite
        }
        if (type == "Gatherer") {
            sprite_index = sprAXUnit2; // Player 3, Gatherer sprite
        }
    }
    if (global.p3character == 4) {
        if (type == "Attacker") {
            sprite_index = sprWRUnit1; // Player 3, Attacker sprite
        }
        if (type == "Gatherer") {
            sprite_index = sprWRUnit2; // Player 3, Gatherer sprite
        }
    }
}

// Player 4
if (owner == objP4) {
    if (global.p4character == 1) {
        if (type == "Attacker") {
            sprite_index = sprBlUnit1; // Player 4, Attacker sprite
        }
        if (type == "Gatherer") {
            sprite_index = sprBlUnit2; // Player 4, Gatherer sprite
        }
    }
    if (global.p4character == 2) {
        if (type == "Attacker") {
            sprite_index = sprBBUnit1; // Player 4, Attacker sprite
        }
        if (type == "Gatherer") {
            sprite_index = sprBBUnit2; // Player 4, Gatherer sprite
        }
    }
    if (global.p4character == 3) {
        if (type == "Attacker") {
            sprite_index = sprAXUnit1; // Player 4, Attacker sprite
        }
        if (type == "Gatherer") {
            sprite_index = sprAXUnit2; // Player 4, Gatherer sprite
        }
    }
    if (global.p4character == 4) {
        if (type == "Attacker") {
            sprite_index = sprWRUnit1; // Player 4, Attacker sprite
        }
        if (type == "Gatherer") {
            sprite_index = sprWRUnit2; // Player 4, Gatherer sprite
        }
    }
}

// Sprite direction adjustment (moving left or right)
if (x_previous > x) {
    // Moving left, flip sprite
    image_xscale = -1; // Flip horizontally
} else if (x_previous < x) {
    // Moving right, reset sprite flip
    image_xscale = 1; // Reset to default
}

// Update the previous position for the next frame
x_previous = x;


}



//unit_instance.owner = argument2;   // Assign the owner
//unit_instance.type = argument3;    // Assign the type
//unit_instance.target = argument4;  // Assign the target
//unit_instance.hp = argument5;  // Assign the hp
//unit_instance.damage = argument6;  // Assign the damage