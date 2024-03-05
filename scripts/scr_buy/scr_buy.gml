function scr_buy(object, field_x, field_y, player_number = global.player_number){
	
	if occupied(field_x, field_y, player_number) || object == -1 exit;
	
	var price = scr_get_price(object); 
	if objPlayer.money < price {
		scr_gui_message("Not enough money", 2 * game_speed);
		return -1;
	}
	
	scr_tower_planned_delete(field_x, field_y);
	
	scr_plan_tower(field_x, field_y, object, player_number);
}

function scr_occupy_field(field_x, field_y, player_num = global.player_number) {
	
	if global.campaign {
		scr_change_tile(field_x, field_y, player_num);
		return;
	}

	var map = ds_map_create();
	ds_map_add(map, "playerNumber", player_num);
	ds_map_add(map, "hostNumber", global.host_number);
	ds_map_add(map, "xpos", field_x);
	ds_map_add(map, "ypos", field_y);
	scr_send_map(map, OCCUPY_FIELD);

}

function scr_change_tile(field_x, field_y, player_num) {
	var lay_id = layer_get_id("Ground");
	var map_id = layer_tilemap_get_id(lay_id);
	
	tilemap_set(map_id, player_num + 2, field_x, field_y);
}


//returns if the field is already occupied by another player
function occupied(field_x, field_y, player_number = global.player_number) {
	var occ_by = ds_grid_get(objGame.field_grid_planned_by, field_x, field_y);
	return !(occ_by == player_number || occ_by == -1);
}

function scr_get_price(tower_obj){
	
	var towers = objTowers.tower_list;
	var tower_count = ds_list_size(towers);
	
	var price = -1;
	
	for(var i = 0; i < tower_count; i++) {
		var struct = ds_list_find_value(towers, i);
		if tower_obj == struct.object {
			price = struct.price;
			break;
		}
	}
	
	if price == -1 show_debug_message("Price Error With: " + string(obj));

	return price;
}

function scr_set_price(obj, new_price){
	var towers = objTowers.tower_list;
	var tower_count = ds_list_size(towers);

	for(var i = 0; i < tower_count; i++) {
		var struct = ds_list_find_value(towers, i);
		if obj == struct.object {
			struct.price = new_price;
		}
	}
	
}