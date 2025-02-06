// Get the current camera view
var viewX = camera_get_view_x(view_camera[0]);   // Left position of the camera view
var viewY = camera_get_view_y(view_camera[0]);   // Top position of the camera view
var viewW = camera_get_view_width(view_camera[0]); // Width of the camera view
var viewH = camera_get_view_height(view_camera[0]); // Height of the camera view

// Calculate the position relative to the bottom-right corner of the viewport
// Adjust position with the offsets
x = viewX + viewW + xOffset; // Right edge of the camera view plus the xOffset
y = viewY + viewH + yOffset; // Bottom edge of the camera view plus the yOffset
