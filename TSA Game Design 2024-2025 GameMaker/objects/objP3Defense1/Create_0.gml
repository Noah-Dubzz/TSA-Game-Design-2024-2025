// Defense base stats and variables
hp = 100;         // hp of the defense
upgrades = 0;     // Number of upgrades applied
active = false;   // Starts inactive until the first upgrade is purchased
fire_timer = 0;   // Timer to track when we can fire again

// Constants
detection_range = 500;       // Range within which to detect enemy units
upgrade_cost = 5;            // Base cost for an upgrade; scales with upgrades
base_fire_rate = 60;         // Base delay (in steps) between shots (higher = slower)
base_damage = 0.5;             // Base damage per shot

// Target variable (the enemy unit we are currently firing at)
current_target = noone;

if (global.amountofplayers < 3){
	instance_destroy(self);
}