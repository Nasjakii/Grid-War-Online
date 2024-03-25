

if !can_swap < 0 exit;

if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) && left_released {
	
	state = !state;
	if state {
		//send request to make lobby online
		var map = ds_map_create();
		ds_map_add(map, "planning_time", objPersistent.planning_time_room1);
		ds_map_add(map, "room_size", global.room_size);
		ds_map_add(map, "show_bullets", objPersistent.show_bullets_room1);
		ds_map_add(map, "win_option", objPersistent.win_option_room1);
		ds_map_add(map, "max_players", global.max_players);
		
		scr_send_map(map, CREATE_HOST);
	} else {
		var map = ds_map_create();
		ds_map_add(map, "lobbyNumber", global.lobby_number);
		ds_map_add(map, "playerNumber", global.player_number);
		scr_send_map(map, STOP_HOST);
		
	}
	image_index++;
	
	can_swap = false;
}

