global.player_number = 0;

if objLobbyOnline.state {
	global.online = true;
	var map = ds_map_create();	
	ds_map_add(map, "lobbyNumber", global.lobby_number);
	scr_send_map(map, START_GAME);
	
} else {
	
	objPersistent.planning_time_room1 = objLobby.planning_time;
	objPersistent.win_option_room1 = objLobby.win_option;
	objPersistent.show_bullets_room1 = objLobby.show_bullets;
	room_set_width(Room1, objLobby.room_size);
	room_set_height(Room1, objLobby.room_size);
	
	global.online = false;
	room_goto(Room1);
}

