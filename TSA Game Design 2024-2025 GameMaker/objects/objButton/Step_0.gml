// Get the current camera (viewport) top-left coordinates
var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

// Set the button instance position so that it stays at the desired UI location.
// button_x and button_y are the fixed offsets (set when the button is created).
x = camX + button_x;
y = camY + button_y;

// Now handle mouse interaction.
// (Since the button's world position is adjusted to be fixed in the UI, 
// mouse_x and mouse_y, which are in room coordinates, will work as expected.)
if (mouse_x > x && mouse_x < x + button_width * image_xscale &&
    mouse_y > y && mouse_y < y + button_height * image_yscale)
{
    if (mouse_check_button_pressed(mb_left))
    {
        if (action_script != undefined)
        {
            script_execute(action_script);  // Execute the stored script asset.
        }
    }
}

// (Optional) Additional code for visual feedback (e.g. changing image_blend) can go here.
