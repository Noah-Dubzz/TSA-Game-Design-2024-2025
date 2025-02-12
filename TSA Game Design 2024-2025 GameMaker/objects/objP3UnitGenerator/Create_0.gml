// Initialize hp for defense objects
hp = 100;  // Example hp value (adjust as necessary)

if (global.amountofplayers < 3){
	instance_destroy(self);
}