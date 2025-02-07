if (owner != global.currentplayer){
// Optimized Unit Movement and Damage Handling

// Function to handle unit movement and damage for a given player
function handleMovementAndDamage(targetPlayer, defenses) {
    if (target == targetPlayer) {
        // Ensure defenses is an array
        if (is_array(defenses)) {
            for (var i = 0; i < array_length(defenses); i++) {
                var defense = defenses[i];

                // Check if the defense exists to avoid null reference errors
                if (instance_exists(defense)) {
                    // Move towards the current defense
                    move_towards_point(defense.x, defense.y, 4);

                    // Ensure the unit reaches the defense before attacking
                    if (point_distance(x, y, defense.x, defense.y) <= 4) {
                        // Apply damage to the defense
                        defense.hp -= damage;

                        // Destroy the defense if its HP drops to zero or below
                        if (defense.hp <= 0) {
                            instance_destroy(defense);
                        }

                        // Stop processing further defenses until this one is destroyed
                        break;
                    } else {
                        // Stop trying to attack next defenses until the current one is reached
                        break;
                    }
                }
            }
        }
    }
}

// Arrays to store defenses for each player (manually reversed)
var defensesP1 = [objP1, objP1Base, objP1UnitGenerator, objP1Defense3, objP1Defense2, objP1Defense1];
var defensesP2 = [objP2, objP2Base, objP2UnitGenerator, objP2Defense3, objP2Defense2, objP2Defense1];
var defensesP3 = [objP3, objP3Base, objP3UnitGenerator, objP3Defense3, objP3Defense2, objP3Defense1];
var defensesP4 = [objP4, objP4Base, objP4UnitGenerator, objP4Defense3, objP4Defense2, objP4Defense1];

// Handle movement and damage for each player
handleMovementAndDamage(objP1, defensesP1);
handleMovementAndDamage(objP2, defensesP2);
handleMovementAndDamage(objP3, defensesP3);
handleMovementAndDamage(objP4, defensesP4);

}



//unit_instance.owner = argument2;   // Assign the owner
//unit_instance.type = argument3;    // Assign the type
//unit_instance.target = argument4;  // Assign the target
//unit_instance.hp = argument5;  // Assign the hp
//unit_instance.damage = argument6;  // Assign the damage