

if room = Room1 {
	if global.is_host {
		var map = ds_map_create();
		ds_map_add(map, "hostNumber", global.host_number);
		ds_map_add(map, "playerNumber", global.player_number);
		scr_send_map(map, STOP_HOST);
	} else {
		var map = ds_map_create();
		ds_map_add(map, "hostNumber", global.host_number);
		ds_map_add(map, "playerNumber", global.player_number);
		scr_send_map(map, DISCONNECT_CLIENT);
	}
} 
