// Create a camera view with no initial target
camera = camera_create_view(0, 0, 1000, 562, 0, noone, -1, -1, 0, 0);

// Assign the created camera to the first camera slot in view_camera array
view_camera[0] = camera;
