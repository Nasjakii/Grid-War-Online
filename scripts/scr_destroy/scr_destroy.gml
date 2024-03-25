function scr_destroy(xpos, ypos){ 
	
	var field_pos = scr_convert_position_coordinates(xpos, ypos);
	
	if !global.online {
		scr_destroy_at(field_pos[0], field_pos[1]);
		return;
	}
	
	var field_pos = scr_convert_position_coordinates(xpos, ypos);
	var field_x = field_pos[0];
	var field_y = field_pos[1];
	
	var map = ds_map_create();
	ds_map_add(map, "lobbyNumber", global.lobby_number);
	ds_map_add(map, "xpos", field_x);
	ds_map_add(map, "ypos", field_y);
	
	scr_send_map(map, DESTROY_TOWER);
	
}

function scr_destroy_at(field_x, field_y){ 
	var inst = ds_grid_get(objGrid.field_grid_instances, field_x, field_y);
	
	ds_grid_set(objGrid.field_grid_instances, field_x, field_y, 0);
	ds_grid_set(objGrid.field_grid, field_x, field_y, -1);
	scr_change_tile(field_x, field_y, -1);
	
	if inst <= 0 || !instance_exists(inst) return;
	
	for(var i = -inst.vision_range; i <= inst.vision_range; i++) {
		for(var i2 = -inst.vision_range; i2 <= inst.vision_range; i2++) {
			ds_grid_set(objGrid.field_grid_vision, clamp(field_x + i, 0, objGrid.field_width - 1), clamp(field_y + i2, 0, objGrid.field_height), 0);
		}
	}
	instance_destroy(inst);
	
	
	
}