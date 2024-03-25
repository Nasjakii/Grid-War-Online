/// @description all network functions to send or receive data

function scr_receive_data(automatic_processing = true) {
	
	var t_buffer = ds_map_find_value(async_load, "buffer"); 
	if !buffer_exists(t_buffer) {
		show_debug_message("reading buffer error");
		return;
	}
	buffer_seek(t_buffer, buffer_seek_start, 0);
	var json = buffer_read(t_buffer, buffer_string);
	
	if global.network_debugging show_debug_message("< " + string(json));

	var response = json_decode(json);
	if automatic_processing scr_process_data(response);
	
	return response;
}

function scr_process_data(response) {
	
	var cmd_type = ds_map_find_value(response, "type");
	
	switch(cmd_type){
		case(CREATE_HOST): 
			global.player_number = ds_map_find_value(response, "playerNumber");
			global.lobby_number = ds_map_find_value(response, "lobbyNumber");
		break;
		case(STOP_HOST):
			global.player_number = -1;
			global.lobby_number = -1;
			
			if !global.is_host {
				room_goto(Menu);
			}
			
		break;
		case(GET_HOSTS):
			var host_list = ds_map_find_value(response, "hosts");
			return host_list;
		break;
		case(JOIN_LOBBY):
			if global.is_host {
				var player_count = ds_map_find_value(response, "playerCount");
				objPersistent.lobby_player_count = player_count;
				scr_send_gamesettings();
				
			} else {
				global.player_number = ds_map_find_value(response, "playerNumber");
				global.lobby_number = ds_map_find_value(response, "lobbyNumber");
				scr_debug("player_number: ", global.player_number);
				var player_count = ds_map_find_value(response, "playerCount");
				objPersistent.lobby_player_count = player_count;
				room_goto(ServerRoom); 
			}
			
		break;
		case(GAMESETTINGS):
			if !global.is_host {
				objLobby.planning_time = ds_map_find_value(response, "planning_time");
				objLobby.room_size = ds_map_find_value(response, "room_size");
				objLobby.show_bullets = ds_map_find_value(response, "show_bullets");
				objLobby.win_option = ds_map_find_value(response, "win_option");
				objLobby.values_changed = true;
			}
		break;
		case(START_GAME):
			
			if instance_exists(objLobby) {
				objPersistent.planning_time_room1 = objLobby.planning_time;
				objPersistent.show_bullets_room1 = objLobby.show_bullets;
				objPersistent.win_option_room1 = objLobby.win_option;
				
				room_set_width(Room1, objLobby.room_size);
				room_set_height(Room1, objLobby.room_size);
			
				room_goto(Room1);
			} else {
				show_debug_message("Error Exit on trying to start Game");
				room_goto(Menu); //error exit
			}
		break;
		case(CREATE_TOWER): //create tower

			var player_num = ds_map_find_value(response, "playerNumber");
			var xpos = ds_map_find_value(response, "xpos");
			var ypos = ds_map_find_value(response, "ypos");
			var object = ds_map_find_value(response, "object");
			
			scr_place_tower(player_num, xpos, ypos, object);
			
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
			ds_grid_set(objGrid.field_grid_planned_by, xpos ,ypos, p_num);
			
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
			
			if instance_exists(objGame) objGame.player_count = player_count;
			if instance_exists(objLobby) objLobby.player_count = player_count;
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
