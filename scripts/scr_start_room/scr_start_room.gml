
function scr_start_room(file){
	ini_open(file);
		var name = ini_read_string("Map", "name", "Default Name");
		var size = ini_read_real("Map", "size", 360);
		var map_str = ini_read_string("Map", "data", "[]");
		var lvl_str = ini_read_string("Map", "level", "[]");
		var player_str = ini_read_string("Map", "player_number", "[]");
		var img_str = ini_read_string("Map", "image_index", "[]");

	ini_close();
	

	
	var map_data = json_parse(map_str);
	var lvl_data = json_parse(lvl_str);
	var player_data = json_parse(player_str);
	var img_data = json_parse(img_str);

	
	for(var i = 0; i < array_length(map_data); i++) {
		for(var i2 = 0; i2 < array_length(map_data[0]); i2++) {
			
			//create objects 
			if map_data[i, i2] == -1 continue;
			var inst = scr_editor_tower_place(i, i2, map_data[i,i2], player_data[i, i2], lvl_data[i,i2]);
			inst.image_index = img_data[i,i2];


		}
	}
	
	

	return [name, size];
}