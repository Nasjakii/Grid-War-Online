var _room = asset_get_index("Campaign" + text);
if room_exists(_room) && unlocked {
	room_goto(_room);
	global.campaign = true;
	global.is_host = true;
	global.player_number = 0;
	global.win_option = "Bases";
}



