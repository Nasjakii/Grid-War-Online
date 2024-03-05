function scr_get_tower_upgrade(tower_index, level){
	
	var towers = objTowers.tower_list;
	var upgrades = ds_list_find_value(towers, tower_index).upgrades;
	if level < array_length(upgrades) {
		var _upgrade = upgrades[level];
	
		return _upgrade;
	}
	
	return -1;
}