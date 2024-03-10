
if global.campaign {
	var towers = objTowers.tower_list;
	var index = scr_get_tower_index(id);
	var upgrades = ds_list_find_value(towers, index).upgrades;
	
	var field_pos = scr_convert_position_coordinates(x,y);
	
	scr_occupy_field(field_pos[0], field_pos[1], player_number);
	
	ds_grid_set(objGame.field_grid_instances, field_pos[0], field_pos[1], id);
	ds_grid_set(objGame.field_grid, field_pos[0], field_pos[1], id);
	
	for(var i = 0; i < level; i++) {
		scr_update_tower(field_pos[0], field_pos[1], upgrades[i].variable, upgrades[i].value, false);
	}
}