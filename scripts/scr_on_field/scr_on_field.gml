/// @description mouse on grid

function scr_on_field(field_x, field_y){
	return field_x >= 0 && 
		   field_x <= objGrid.field_width -1 && 
		   field_y >= 0 && 
		   field_y <= objGrid.field_height - 1;
	
}