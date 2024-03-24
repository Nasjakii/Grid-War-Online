
function scr_editor_tower_place(field_x, field_y, object, player_num, lvl){
	var lay = "Tower";

	var inst = instance_create_layer(field_x * tile_size, field_y * tile_size, lay, object);
	inst.player_number = player_num;
	inst.level = lvl;
	ds_grid_set(objGrid.field_grid_instances, field_x, field_y, inst);
	ds_grid_set(objGrid.field_grid, field_x, field_y, object);
	scr_change_tile(field_x, field_y, player_num);
	
	return inst;
}