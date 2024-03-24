
var tile_s = tile_size;
var field_x = clamp(floor(x/tile_s), aoe_size, objGrid.field_width - 1 - aoe_size);
var field_y = clamp(floor(y/tile_s), aoe_size, objGrid.field_height - 1 - aoe_size);
var x1 = field_x * tile_s;
var y1 = field_y * tile_s;

draw_set_color(c_aqua);
draw_set_alpha(0.6);
for(var i = -aoe_size; i <= aoe_size; i++) {
	for(var i2 = -aoe_size; i2 <= aoe_size; i2++) {
		
		draw_rectangle(x1 + i * tile_s,
					   y1 + i2 * tile_s,
					   x1 + tile_s + i * tile_s,
					   y1 + tile_s + i2 * tile_s, false);
	}
}
draw_set_color(c_white);
draw_set_alpha(1);


if left_released {
	
	if instance_exists(striker_inst) && striker_inst.object_index == objStriker {
		scr_update_tower(striker_field_x, striker_field_y, "target_field_x", field_x);
		scr_update_tower(striker_field_x, striker_field_y, "target_field_y", field_y);
	}
	instance_destroy(self);
	objGUI.overlay_type = "";
}
