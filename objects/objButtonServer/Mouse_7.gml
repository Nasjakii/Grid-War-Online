
global.is_host = true;
		
		
var map = ds_map_create();
var buff = buffer_create(10, buffer_grow, 1);
ds_map_add(map, "type", CREATE_HOST);
ds_map_add(map, "planning_time", global.planning_time);
ds_map_add(map, "room_size", global.room_size);
ds_map_add(map, "show_bullets", global.bullets_show_always);
ds_map_add(map, "win_option", global.win_option);
ds_map_add(map, "max_players", global.max_players);
var data_json = json_encode(map);
ds_map_destroy(map);

buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_text, data_json);

network_send_raw(global.socket, buff, buffer_tell(buff), 1);



