function create_unit(x, y, owner, unit_type, target, hp, damage) {
    // Create an instance of objUnit at the specified position (x, y)
    var unit_instance = instance_create_layer(x, y, "Units", objUnit);

    // Set the properties for the new unit
    unit_instance.owner = owner;           // The owner (player) of the unit
    unit_instance.type = unit_type;        // The type of the unit (e.g., attacker, gatherer)
    unit_instance.target = target;         // The target unit (enemy base or defense)
    unit_instance.hp = hp;         // The hp of the unit
    unit_instance.damage = damage;         // The damage the unit does
	global.doingsomething = false;
}
