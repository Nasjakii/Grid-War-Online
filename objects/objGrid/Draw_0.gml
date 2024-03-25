
#region fog
if !disable_fog { //fog is drawing a surface over non-tower elements

	if !surface_exists(surface_fog) surface_fog = surface_create(room_width,room_height);

	surface_set_target(surface_fog);
	
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0,0,room_width,room_height, false);
	draw_set_color(c_white);
	draw_set_alpha(1);

	gpu_set_blendmode(bm_subtract);
	var tower_elements = layer_get_all_elements("Tower");
	for(var i = 0; i < array_length(tower_elements); i++) {
		if layer_get_element_type(tower_elements[i]) == layerelementtype_instance {
			var inst = layer_instance_get_instance(tower_elements[i]);
			var xpos = floor(inst.x / tile_size);
			var ypos = floor(inst.y / tile_size);
		
			var pos = scr_convert_position_grid(xpos,ypos);
			draw_rectangle(pos[0] - tile_size                   * inst.vision_range, 
						   pos[1] - tile_size                   * inst.vision_range,
						   pos[0] + tile_size       + tile_size * inst.vision_range, 
						   pos[1] + (tile_size - 1) + tile_size * inst.vision_range, false);
					   
			ds_grid_set(field_grid_vision, xpos, ypos, 1);
			ds_grid_set_region(field_grid_vision, xpos - inst.vision_range, ypos - inst.vision_range,
												  xpos + inst.vision_range, ypos + inst.vision_range, 1);
		
		}
	}
	gpu_set_blendmode(bm_normal);

	surface_reset_target();
	draw_surface(surface_fog,0,0);
} 
#endregion



if draw_grid {
	scr_draw_set(fa_right, fa_top, c_black, foDebugSmall);
	for(var i = 0; i < field_width; i++) {
		for(var i2 = 0; i2 < field_height; i2++) {
			draw_text(tile_size * i, tile_size * i2, ds_grid_get(field_grid_vision, i, i2));
			draw_rectangle(tile_size * i, tile_size * i2, tile_size * (i + 1), tile_size * (i2 + 1), true);
		}
	}
	
}






