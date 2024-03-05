function scr_plan_tower(field_x, field_y, tower_obj, player_number = global.player_number){
	
	scr_set_tower_planned(field_x, field_y, tower_obj);
	
	var part_sys = part_system_create_layer(layer_get_id("Below"), false, psPlace);
	part_system_position(part_sys,(field_x + 0.5) * tile_size,(field_y + 0.5) * tile_size);
	
	var inst = instance_create_layer(field_x * tile_size, field_y * tile_size, "Instances", objPlanner);
	inst.sprite_index = object_get_sprite(tower_obj);
	
	
	var price = scr_get_price(tower_obj); 
	objPlayer.money -= price;
	
	
	if tower_obj == objCollector scr_set_price(objCollector, scr_get_price(objCollector) + 3);
	
	scr_occupy_field(field_x, field_y, player_number);
	
}