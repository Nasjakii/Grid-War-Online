var _room = asset_get_index("Campaign" + text);
if room_exists(_room) && unlocked {
	
	global.campaign = true;
	global.online = false;
	global.is_host = true;
	global.player_number = 0;
	global.max_players = 1;
	objPersistent.win_option_campaign = "Bases";
	
	
	if text == "test" objPersistent.win_option_campaign = "Testing";
	room_goto(_room);
}



