// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_unit(){

// Script: create_unit
// This script will create an objUnit and set its properties

// Create an instance of objUnit in the "Units" layer at the specified position (x, y)
var unit_instance = instance_create_layer(argument0, argument1, "Units", objUnit);

// Set the properties
unit_instance.owner = argument2;   // Assign the owner
unit_instance.type = argument3;    // Assign the type
unit_instance.target = argument4;  // Assign the target
unit_instance.health = argument5;  // Assign the health
unit_instance.damage = argument6;  // Assign the damage

}