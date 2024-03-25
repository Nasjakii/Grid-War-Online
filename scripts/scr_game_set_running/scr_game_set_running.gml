
function scr_game_set_running(running) {
	
	if !global.online {
		game_running = running;
		return;
	}
	
	
	var map = ds_map_create();
	ds_map_add(map, "running", running);
	ds_map_add(map, "lobbyNumber", global.lobby_number);
	scr_send_map(map, RUNNING);

	
}



