// Set depth to ensure this object is rendered above others (closer to the screen)
depth = -100;  // A negative value moves the object towards the foreground

// Set position offsets for the object to adjust its position on the screen
xOffset = -100;  // Offset from the right edge of the screen (move it to the left by 100 pixels)
yOffset = -50;   // Offset from the bottom edge of the screen (move it up by 50 pixels)

// Initialize a global variable to track the end of the turn
global.endturn = false;  // This flag will control whether the turn has ended
