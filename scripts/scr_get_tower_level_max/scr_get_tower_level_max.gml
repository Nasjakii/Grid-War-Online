function scr_get_tower_level_max(inst, tower_index){
	
	var towers = objTowers.tower_list;
	var struct = ds_list_find_value(towers, tower_index);
	if struct.object == inst.object_index {
		return array_length(struct.upgrades);
	}
	
	return -1;
}