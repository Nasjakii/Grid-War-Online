
function scr_save_map(file_path, map_name, size){
	
	var object_array = [[]];
	var level_array = [[]];
	var player_number_array = [[]];
	var img_index_array = [[]];

	if instance_exists(objGrid) {
		for(var i = 0; i < ds_grid_width(objGrid.field_grid); i++) {
			for(var i2 = 0; i2 < ds_grid_height(objGrid.field_grid); i2++) {
				object_array[i, i2] = ds_grid_get(objGrid.field_grid, i, i2);
				var inst = ds_grid_get(objGrid.field_grid_instances, i, i2);
		
				if inst <= 0 {
					level_array[i, i2] = -1;
					player_number_array[i,i2] = -1;
					img_index_array[i,i2] = 0;
					continue;
				} else {
					show_debug_message(inst.player_number);
					level_array[i, i2] = inst.level;
					player_number_array[i,i2] = inst.player_number;
					img_index_array[i,i2] = inst.image_index;
				}
			}
		}
	} else {
		show_debug_message("create empty map");
	}
	
	
	//convert to map 
	//save as json
	show_debug_message(file_path);
	ini_open(file_path);
		ini_write_string("Map", "name", map_name);
		ini_write_real("Map", "size", size);
		var obj_arr_str = json_stringify(object_array);
		ini_write_string("Map", "data", obj_arr_str);
		var lvl_arr_str = json_stringify(level_array);
		ini_write_string("Map", "level", lvl_arr_str);
		var player_number_arr_str = json_stringify(player_number_array);
		ini_write_string("Map", "player_number", player_number_arr_str);
		var img_index_array_str = json_stringify(img_index_array);
		ini_write_string("Map", "image_index", img_index_array_str);
		
		
	ini_close();
}