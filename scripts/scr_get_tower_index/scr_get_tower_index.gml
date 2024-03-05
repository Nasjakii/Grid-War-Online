function scr_get_tower_index(inst){
	var towers = objTowers.tower_list;
	for(var i = 0; i < ds_list_size(towers); i++) {
		var struct = ds_list_find_value(towers, i);
		if struct.object == inst.object_index {
			return i;
		}
	}
	
	
}