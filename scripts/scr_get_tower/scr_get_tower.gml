function scr_get_tower(field_x, field_y){
	
	var inst = ds_grid_get(objGame.field_grid_instances, field_x, field_y);
	if inst <= 0 || !instance_exists(inst) {
		return -1;
	}
	
	return inst;
}