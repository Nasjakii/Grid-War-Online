function scr_convert_position_grid(field_x, field_y){
	var pos = [];
	pos[0] = tile_size * field_x;
	pos[1] = tile_size * field_y;
	return pos;
}

function scr_convert_position_coordinates(xpos, ypos){
	var pos = [];
	pos[0] = floor(xpos / tile_size);
	pos[1] = floor(ypos / tile_size);
	return pos;
}