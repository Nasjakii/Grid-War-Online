function scr_in_vision_coords(xpos, ypos){
	var vision_grid = ds_grid_get(objGrid.field_grid_vision, floor(xpos / tile_size), floor(ypos / tile_size));
	return vision_grid == 1 || objGrid.disable_fog == true
}

function scr_in_vision_grid(field_x, field_y){
	var vision_grid = ds_grid_get(objGrid.field_grid_vision, field_x, field_y);
	return vision_grid == 1 || objGrid.disable_fog == true
}