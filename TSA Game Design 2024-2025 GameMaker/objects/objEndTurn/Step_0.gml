

// Get current camera view
var viewX = camera_get_view_x(view_camera[0]);
var viewY = camera_get_view_y(view_camera[0]);
var viewW = camera_get_view_width(view_camera[0]);
var viewH = camera_get_view_height(view_camera[0]);

// Position at bottom-right of UI
x = viewX + viewW + xOffset; // Right edge minus offset
y = viewY + viewH + yOffset; // Bottom edge minus offset
