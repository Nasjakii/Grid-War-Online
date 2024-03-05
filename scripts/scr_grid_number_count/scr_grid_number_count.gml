function scr_grid_number_count(grid_id, val){
	
	var val_count = 0;
	for(var i = 0; i < ds_grid_width(grid_id); i++) {
		for(var i2 = 0; i2 < ds_grid_height(grid_id); i2++) {
			if ds_grid_get(grid_id,i,i2) == val val_count++;
		}
	}
	return val_count;
}