/// @description mouse on grid

function scr_on_field(){
	var pos = scr_get_field_position();
	
	return pos[0] >= 0 && 
		   pos[0] <= objGrid.field_width -1 && 
		   pos[1] >= 0 && 
		   pos[1] <= objGrid.field_height - 1;
	
}