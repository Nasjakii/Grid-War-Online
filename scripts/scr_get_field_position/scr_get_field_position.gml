/// @description return x,y position of the mouse in field coords

function scr_get_field_position(){
	var grid_pos = [];
	grid_pos[0] = floor(mouse_x / tile_size);
	grid_pos[1] = floor(mouse_y / tile_size);

	return grid_pos;
}

