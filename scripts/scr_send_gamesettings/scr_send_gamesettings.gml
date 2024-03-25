function scr_send_gamesettings(){
	var map = ds_map_create();
	ds_map_add(map, "lobbyNumber", global.lobby_number);
	ds_map_add(map, "room_size"    , objLobby.room_size);
	ds_map_add(map, "planning_time", objLobby.planning_time);
	ds_map_add(map, "show_bullets" , objLobby.show_bullets);
	ds_map_add(map, "win_option"   , objLobby.win_option);

	scr_send_map(map, GAMESETTINGS); 
}