function scr_tower_create(object, field_x, field_y, player_num = global.player_number){
	
	if !global.online {
		scr_place_tower(player_num, field_x, field_y, object);
		return;
	}
	
	
	var map = ds_map_create();
	ds_map_add(map, "playerNumber", player_num);
	ds_map_add(map, "hostNumber", global.host_number);
	ds_map_add(map, "xpos", field_x);
	ds_map_add(map, "ypos", field_y);
	ds_map_add(map, "object", object);
	scr_send_map(map, CREATE_TOWER);
	
}

function scr_place_tower(player_num, field_x ,field_y, object){
	var lay = "Enemies";
	if player_num == global.player_number lay = "Tower";
	var inst = instance_create_layer(field_x * tile_size,field_y * tile_size, lay, object, {player_number : player_num});
	
	ds_grid_set(objGrid.field_grid_instances, field_x, field_y, inst);
	ds_grid_set(objGrid.field_grid, field_x, field_y, object);
	ds_grid_set(objGrid.field_grid_planned_objects, field_x, field_y, -1);
	ds_grid_set(objGrid.field_grid_planned_by, field_x, field_y, -1);
	
	return inst;
}
