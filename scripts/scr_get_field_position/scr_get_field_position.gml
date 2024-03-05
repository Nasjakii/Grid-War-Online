/// @description return x,y position of the mouse in field coords

function scr_get_field_position(){
	var pos = [];
	pos[0] = floor((mouse_x - objGame.field_x) / tile_size);
	pos[1] = floor((mouse_y - objGame.field_y) / tile_size);
	
	return pos;
}

