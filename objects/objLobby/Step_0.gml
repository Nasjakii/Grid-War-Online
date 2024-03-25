
player_count = objPersistent.lobby_player_count;

if !global.is_host && values_changed {
	
	objRoomSize.string_val = string(room_size);
	objPlanningTime.string_val = string(planning_time / game_speed);
	objDropDownGamemode.picked = string(win_option);
	objShowBullets.image_index = string(show_bullets);
	
}


if global.is_host && values_changed {
	scr_send_gamesettings();
	
	values_changed = false;
}
