

if join {
	var map = ds_map_create();
	ds_map_add(map, "lobbyNumber", local_host_number);
	ds_map_add(map, "playerNumber", local_player_number);
	scr_send_map(map, JOIN_LOBBY);
	
	join = false;
}
