// Check if the unit has a valid target and the target exists in the game world
if (unit_target != undefined && instance_exists(unit_target)) {
    // Get the target's current position
    var target_x = unit_target.x;
    var target_y = unit_target.y;

    // Calculate the direction from the unit to the target (in degrees)
    var direction_to_target = point_direction(x, y, target_x, target_y);

    // Set the movement speed (adjustable for different game mechanics)
    speed = 4;

    // Calculate the distance between the unit and its target
    var distance_to_target = point_distance(x, y, target_x, target_y);

    // Check if the unit is far enough from the target to move towards it
    if (distance_to_target > 5) {
        // Move the unit towards the target at the defined speed
        move_towards_point(target_x, target_y, speed);
    } else {
        // If the unit is close to the target, stop moving
        speed = 0; // Stop moving when close enough to target
    }
} else {
    // If there's no valid target or the target no longer exists, stop the unit's movement
    speed = 0;
}
