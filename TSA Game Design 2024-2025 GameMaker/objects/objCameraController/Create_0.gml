// Create a camera view for following objP1
// Arguments: (x, y, width, height, layer, target, x_offset, y_offset, hborder, vborder)
camera = camera_create_view(0, 0, 1000, 562, 0, objP1, -1, -1, 0, 0);

// Assign the created camera to the first camera slot in view_camera array
view_camera[0] = camera;