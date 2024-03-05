

if get_hosts {
	get_hosts = false;
	alarm[0] = refresh_rate;
	
	var map = ds_map_create();
	var buff = buffer_create(10, buffer_grow, 1);
	ds_map_add(map, "type", GET_HOSTS);
	var data_json = json_encode(map);
	ds_map_destroy(map);
	
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_text, data_json);
	
	network_send_raw(global.socket, buff, buffer_tell(buff), 1);
	
}


//scr_join_host(); 