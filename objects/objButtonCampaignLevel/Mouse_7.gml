var _room = asset_get_index("Campaign" + text);
if room_exists(_room) && unlocked {
	
	global.campaign = true;
	global.is_host = true;
	global.player_number = 0;
	global.max_players = 1;
	global.win_option = "Testing";
	
	room_goto(_room);
}



