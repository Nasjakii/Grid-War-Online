/// @description returns the player number of a tower

function scr_get_owner(field_x, field_y){
	var inst = ds_grid_get(objGrid.field_grid_instances, field_x, field_y);
	if inst <= 0 return -1;
	return inst.player_number;
	
}