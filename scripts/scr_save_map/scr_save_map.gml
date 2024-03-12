
function scr_save_map(file_name, map_name, size, map_array, level_array, player_number_array, img_index_array){
	//convert to map 
	//save as json
	
	ini_open(file_name);
		ini_write_string("Map", "name", map_name);
		ini_write_real("Map", "size", size);
		var obj_arr_str = json_stringify(map_array);
		ini_write_string("Map", "data", obj_arr_str);
		var lvl_arr_str = json_stringify(level_array);
		ini_write_string("Map", "level", lvl_arr_str);
		var player_number_arr_str = json_stringify(player_number_array);
		ini_write_string("Map", "player_number", player_number_arr_str);
		var img_index_array_str = json_stringify(img_index_array);
		ini_write_string("Map", "image_index", img_index_array_str);
		
		
	ini_close();
}