/*
Script: create_button(name, x, y, width, height, button_text, action_script)
Parameters:
    name         - Unique identifier for the button (e.g., "End Turn")
    x, y         - Position of the button on the screen (UI offset)
    width, height- Desired final dimensions of the button
    button_text  - Text displayed on the button
    action_script- The script asset to call when the button is clicked
*/

function create_button(name, x, y, width, height, button_text, action_script) {
    // Create the button instance on the "UI" layer using objButton
    var button = instance_create_layer(x, y, "UI", objButton);
    
    // Set the button's properties
    button.button_name = name;
    button.button_x = x;  // The UI offset x (used later to re-position relative to the camera)
    button.button_y = y;  // The UI offset y
    button.button_width = width;
    button.button_height = height;
    button.button_text = button_text;  // The text displayed on the button
    button.action_script = action_script;  // The script asset to execute on click
    
    // Assuming the default sprite size is 640x164 at 1x scale
    var default_width = 640;
    var default_height = 164;
    
    // Calculate scale factors based on the desired dimensions
    var x_scale = width / default_width;
    var y_scale = height / default_height;
    
    // Apply the scaling to the button's sprite
    button.image_xscale = x_scale;
    button.image_yscale = y_scale;
    
    // Dynamically adjust the font size based on button height (tweak the multiplier as needed)
    button.font_size = max(height * 0.3, 14); // Font size is based on height (set a min size of 14)
    
    // Return the button instance for further manipulation if needed
    return button;
}
