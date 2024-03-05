/// @description all network functions to send or receive data

function scr_receive_data(sender = undefined) {
	//receive data
	var t_buffer = ds_map_find_value(async_load, "buffer"); 

	buffer_seek(t_buffer, buffer_seek_start, 0);
	var json = buffer_read(t_buffer, buffer_string); //read the json
	var response = json_decode(json);
	if global.network_debugging show_debug_message("< " + string(json));
	
    var cmd_type = ds_map_find_value(response, "type");
	
	switch(cmd_type){
		case(CREATE_HOST): 
			global.player_number = ds_map_find_value(response, "playerNumber");
			global.host_number = ds_map_find_value(response, "hostNumber");
			room_goto(Room1);

		break;
		case(STOP_HOST):
			global.player_number = -1;
			global.host_number = -1;
			room_goto(Menu);
		break;
		case(GET_HOSTS):
			var host_list = ds_map_find_value(response, "hosts");
			return host_list;
		break;
		case(JOIN_HOST):
			if !global.is_host {
				global.player_number = ds_map_find_value(response, "playerNumber");
				global.host_number = ds_map_find_value(response, "hostNumber");
			
				var game_setting_map = ds_map_find_value(response, "gamesetting");
				global.planning_time = ds_map_find_value(game_setting_map, "planning_time");
				global.room_size = ds_map_find_value(game_setting_map, "room_size");
				global.bullets_show_always = ds_map_find_value(game_setting_map, "show_bullets");
				global.win_option = ds_map_find_value(game_setting_map, "win_option");
				global.max_players = ds_map_find_value(game_setting_map, "max_players");

				room_goto(Room1);
			} else {
				//info that someone spawned (playercount)
				var player_count = ds_map_find_value(response, "playerCount");
				objGame.player_count = player_count;
			}
		break;
		case(CREATE_TOWER): //create tower

			var player_num = ds_map_find_value(response, "playerNumber");
			var xpos = ds_map_find_value(response, "xpos");
			var ypos = ds_map_find_value(response, "ypos");
			var object = ds_map_find_value(response, "object");
			
			scr_place_tower(player_num, xpos, ypos, object);
			
		break;
		case(GRIDINFO): //rework for online if nessesarry
			if global.is_host { //send Gridinfo
				for(var i = 0; i < objGame.field_width; i++) { 
					var g_buffer = buffer_create(1, buffer_grow, 1);
					buffer_seek(g_buffer, buffer_seek_start, 0);
					buffer_write(g_buffer, buffer_u16,	GRIDINFO);
					buffer_write(g_buffer, buffer_u16, i); //the row
					//var arr = [];
					for(var i2 = 0; i2 < objGame.field_height; i2++) { 
						
						buffer_write(g_buffer, buffer_s16, ds_grid_get(objGame.field_grid, i, i2)); //safe object id
						//arr[i2] = ds_grid_get(objGame.field_grid, i, i2);
						
					}
					scr_send_buffer(g_buffer);
					buffer_delete(g_buffer);
				}
				
				
			} else { //receive Gridinfo
				//Gridinfo incoming
				
				//var arr = [];
				var row = buffer_read(t_buffer, buffer_u16);
				for(var i2 = 0; i2 < objGame.field_height; i2++) {
					var row_info = buffer_read(t_buffer, buffer_s16);
					//arr[i2] = row_info;
					ds_grid_set(objGame.field_grid, row, i2, row_info);
				}
				//show_debug_message("row: " + string(row) + " info: " + string(arr));
				
			}
			
			
		break;
		case(RUNNING):
			var running = ds_map_find_value(response, "running");
			objGame.game_running = running;
		break;
		case(OCCUPY_FIELD):
			var p_num = ds_map_find_value(response, "playerNumber");
			var xpos = ds_map_find_value(response, "xpos");
			var ypos = ds_map_find_value(response, "ypos");
			
			scr_change_tile(xpos, ypos, p_num);
			ds_grid_set(objGame.field_grid_planned_by, xpos ,ypos, p_num);
			
		break;
		case(UPDATE_TOWER):
			var xpos = ds_map_find_value(response, "xpos");
			var ypos = ds_map_find_value(response, "ypos");
			
			var var_to_update = ds_map_find_value(response, "variable_name");
			var new_val = ds_map_find_value(response, "variable_value");
			var upgrade = ds_map_find_value(response, "upgrade");
			
			scr_update_tower_apply(xpos, ypos, var_to_update, new_val, upgrade);
		break;
		case(DESTROY_TOWER):
			var field_x = ds_map_find_value(response, "xpos");
			var field_y = ds_map_find_value(response, "ypos");
			
			scr_destroy_at(field_x, field_y);
			
		break;
		case(DISCONNECT_CLIENT):
			var player_count = ds_map_find_value(response, "playerCount");
			objGame.player_count = player_count;
		break;

	}
	
	
}


function scr_send_map(map, type) {
	var buffer = buffer_create(10, buffer_grow, 1);
	
	ds_map_add(map, "type", type);
	var data_json = json_encode(map);
	if global.network_debugging show_debug_message("> " + data_json);
	ds_map_destroy(map);
	
	buffer_seek(buffer, buffer_seek_start, 0);
	buffer_write(buffer, buffer_text, data_json);
	network_send_raw(global.socket, buffer, buffer_tell(buffer), 1);
	
	buffer_delete(buffer);
}
