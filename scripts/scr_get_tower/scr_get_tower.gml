function scr_get_tower(field_x, field_y){
	
	if field_x < 0 || field_x >= objGrid.field_width || field_y < 0 || field_y >= objGrid.field_height return -1;
	
	var inst = ds_grid_get(objGrid.field_grid_instances, field_x, field_y);
	if inst <= 0 || !instance_exists(inst) {
		return -1;
	}
	
	return inst;
}