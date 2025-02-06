// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_unit(){
	/// scr_create_unit(x, y, owner, base, type)

// Arguments
var _x = argument0; // X position
var _y = argument1; // Y position
var _owner = argument2; // Unit owner (e.g., 1 for P1, 2 for P2)
var _base = argument3; // Base unit belongs to (could be an instance ID)
var _type = argument4; // Unit type (e.g., "Infantry", "Tank", etc.)
var _target = argument5; // Target

// Create the unit
var _unit = instance_create_layer(_x, _y, "Units", objUnit);

// Assign properties
_unit.unit_owner = _owner;
_unit.unit_base = _base;
_unit.unit_type = _type;
_unit.unit_target = _target;

// Return unit instance
return _unit;

}