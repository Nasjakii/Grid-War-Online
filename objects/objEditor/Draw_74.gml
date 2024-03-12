

scr_draw_hud(999999, objTowers.tower_list_editor);


draw_set_color(c_white);
var pos_arr = [gui_width - 100, 0, gui_width, 100];

scr_draw_rectangle(pos_arr, false);


if scr_mouse_gui_in_array(pos_arr) && left_released {
	var arr = [[]];
	var level = [[]];
	var player_arr = [[]];
	var img_index_arr = [[]];
	
	for(var i = 0; i < ds_grid_width(objGrid.field_grid); i++) {
		for(var i2 = 0; i2 < ds_grid_height(objGrid.field_grid); i2++) {
			arr[i, i2] = ds_grid_get(objGrid.field_grid, i, i2);
			var inst = ds_grid_get(objGrid.field_grid_instances, i, i2);
			
			if inst <= 0 {
				level[i, i2] = -1;
				player_arr[i,i2] = -1;
				img_index_arr[i,i2] = 0;
				continue;
			};
			level[i, i2] = inst.level;
			player_arr[i,i2] = inst.player_number;
			img_index_arr[i,i2] = inst.image_index;
		}
	}

	scr_save_map(global.map_file_name, map_name, map_size, arr, level, player_arr, img_index_arr);
}


