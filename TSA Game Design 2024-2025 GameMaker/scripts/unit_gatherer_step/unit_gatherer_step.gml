function unit_gatherer_step() {
    /// @description Handles the step logic for Gatherer units.
    
    // Ensure speed is valid
    if (!variable_instance_exists(id, "speed") || speed <= 0) {
        speed = 2; // Default speed if not set
    }
    
    // Step 1: Find the nearest resource if not carrying one
    if (!carrying_resource) {
        // Find the nearest resource instance
        target_resource = instance_nearest(x, y, objResourceDrop);
        
        if (target_resource != noone) {
            var distToResource = point_distance(x, y, target_resource.x, target_resource.y);
            // Only move if the resource is further than a small tolerance (to avoid collision issues)
            if (distToResource > 4) {
                move_towards_point(target_resource.x, target_resource.y, speed);
            } else {
                // Already close—do nothing here so that attack logic can take over
            }
        } else {
        }
    }
    
    // Step 2: Gather the resource if reached
    if (target_resource != noone && instance_exists(target_resource)) {
        // Use a distance check instead of place_meeting for a smoother transition
        if (point_distance(x, y, target_resource.x, target_resource.y) <= 4) {
            attack_timer -= 1;
            if (attack_timer <= 0) {
                attack_timer = attack_speed; // Reset attack timer
                target_resource.hp -= attack_damage;
                if (target_resource.hp <= 0) {
                    instance_destroy(target_resource);
                    carrying_resource = true;
                    target_resource = noone;
                }
            }
        }
    }
    
    // Step 3: Return to the owner if carrying a resource
    if (carrying_resource) {
        var distToOwner = point_distance(x, y, owner.x, owner.y);
        if (distToOwner > 4) {
            move_towards_point(owner.x, owner.y, speed);
        } else {
            owner.resources += 5;
            carrying_resource = false;
        }
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
