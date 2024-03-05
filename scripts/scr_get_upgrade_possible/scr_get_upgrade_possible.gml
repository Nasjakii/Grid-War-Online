function scr_get_upgrade_possible(inst, _upgrade, max_level){
	
	if !(inst.level < max_level) {
		scr_gui_message("Max Level Reached", 2 * game_get_speed(gamespeed_fps));
		return false
	}
	
	var enough_level = (objPlayer.level > inst.level || inst.object_index == objBase);
	if !enough_level {
		scr_gui_message("Higher Base Tier needed", 2 * game_get_speed(gamespeed_fps));
		return false
	}
	
	var enough_money = objPlayer.money >= _upgrade.price;
	if !enough_money {
		scr_gui_message("Not Enough Money", 2 * game_get_speed(gamespeed_fps));
		return false
	}
	
	
	return true;
}