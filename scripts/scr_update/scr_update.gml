function scr_update_tower(field_x, field_y, var_to_update, new_val, _upgrade = false){
	
	if !global.online {
		scr_update_tower_apply(field_x, field_y, var_to_update, new_val, _upgrade);
		return;
	}
	
	var map = ds_map_create();
	
	ds_map_add(map, "lobbyNumber", global.lobby_number);
	ds_map_add(map, "xpos", field_x);
	ds_map_add(map, "ypos", field_y);
	ds_map_add(map, "variable_name", var_to_update);
	ds_map_add(map, "variable_value", new_val);
	ds_map_add(map, "upgrade", _upgrade);
	
	scr_send_map(map, UPDATE_TOWER);
	
	
}

function scr_update_tower_apply(field_x, field_y, var_to_update, new_val, _upgrade = false) {	
	var inst = ds_grid_get(objGrid.field_grid_instances, field_x , field_y);
	if inst <= 0 || !instance_exists(inst) return;
	if var_to_update == "hp_max" variable_instance_set(inst, "hp", inst.hp + new_val - inst.hp_max);
	variable_instance_set(inst, var_to_update, new_val);
	
	if _upgrade inst.level++;
}
