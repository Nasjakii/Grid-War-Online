
if !global.is_host && values_changed {
	
	objRoomSize.string_val = string(room_size);
	objPlanningTime.string_val = string(planning_time / game_speed);
	objDropDownGamemode.picked = string(win_option);
	objShowBullets.image_index = string(show_bullets);
	
}


if global.is_host && values_changed {
	var map = ds_map_create();
	ds_map_add(map, "hostNumber", global.host_number);
	ds_map_add(map, "room_size"    , room_size);
	ds_map_add(map, "planning_time", planning_time);
	ds_map_add(map, "show_bullets" , show_bullets);
	ds_map_add(map, "win_option"   , win_option);

	scr_send_map(map, GAMESETTINGS); 

	values_changed = false;
}
