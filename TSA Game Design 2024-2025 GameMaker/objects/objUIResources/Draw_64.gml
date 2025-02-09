// Draw GUI Event for objUIResources
var resource_count = global.resources[global.currentturn - 1]; // Resources of current player

draw_set_font(font_size);
draw_set_color(c_white);
draw_text(10, 10, "Resources: " + string(resource_count));  // Display resources at position (10, 10)
