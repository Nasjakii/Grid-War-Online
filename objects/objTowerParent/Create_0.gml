if global.campaign {
	var towers = objTowers.tower_list;
	var index = scr_get_tower_index(id);
	var upgrades = ds_list_find_value(towers, index).upgrades;
	
	var field_pos = scr_convert_position_coordinates(x,y);
	
	for(var i = 0; i < level; i++) {
		scr_update_tower(field_pos[0], field_pos[1], upgrades[i].variable, upgrades[i].value, false);
	}
}