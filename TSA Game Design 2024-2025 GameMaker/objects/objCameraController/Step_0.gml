// Find the current player object
var target = noone;

switch(global.currentturn) {
    case 1: target = instance_exists(objP1) ? objP1 : noone; break;
    case 2: target = instance_exists(objP2) ? objP2 : noone; break;
    case 3: target = instance_exists(objP3) ? objP3 : noone; break;
    case 4: target = instance_exists(objP4) ? objP4 : noone; break;
}

if (target != noone) {
    var target_x = target.x - camera_get_view_width(view_camera[0]) / 2;
    var target_y = target.y - camera_get_view_height(view_camera[0]) / 2;

    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);

    cam_x = lerp(cam_x, target_x, 0.1); // Smooth interpolation
    cam_y = lerp(cam_y, target_y, 0.1);
    
    camera_set_view_pos(view_camera[0], cam_x, cam_y);
}