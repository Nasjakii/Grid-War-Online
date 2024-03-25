function scr_disconnect(is_host){
	
	if global.lobby_number == -1 exit; //Not connected to a lobby
	
	var map = ds_map_create();
	ds_map_add(map, "lobbyNumber", global.lobby_number);
	ds_map_add(map, "playerNumber", global.player_number);
	
	if is_host scr_send_map(map, STOP_HOST); else scr_send_map(map, DISCONNECT_CLIENT);
	
	
}