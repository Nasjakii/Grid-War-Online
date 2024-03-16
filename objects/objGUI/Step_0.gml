
var gm = scr_get_field_position(); //grid mouse position
var gm_x = gm[0];
var gm_y = gm[1];

var tower_list = objTowers.tower_list;

#region multi buy
	var num_key = scr_get_numkey();
	if num_key != -1 && num_key <= ds_list_size(tower_list) {
		obj = ds_list_find_value(tower_list, num_key - 1).object;
		
		if obj == multi_buy_obj multi_buy_obj = -1; else multi_buy_obj = obj; //deselect when pressed twice
		
	}

	if multi_buy_obj != -1 {
		if keyboard_check_released(ord("Q")) {
			multi_buy_obj = -1;
			overlay_type = "";
		}
		
		if left_released scr_buy(multi_buy_obj, gm_x, gm_y, objPlayer.money);
	}
	
#endregion

if mouse_check_button(mb_right) && scr_get_owner(gm_x, gm_y) == global.player_number destroy_timer++ else destroy_timer = 0;
if destroy_timer > destroy_duration {
	scr_destroy_at(gm_x, gm_y);
	destroy_timer = 0;
}


#region multi select
	multi_select = keyboard_check_direct(vk_control); //multi select
	if keyboard_check_released(vk_control) && ds_list_size(multi_select_objects) != 0 {
		overlay_type = "Multi Select";
	}

	if !multi_select && overlay_type != "Multi Select" {
		ds_list_clear(multi_select_objects);
	} 
#endregion





if !scr_on_field(gm_x, gm_y) exit;

var field_object = scr_get_tower(gm_x, gm_y);
if mouse_check_button_released(mb_left) && overlay_type = "" { //open tower overlay

	clicked_field[0] = gm_x;
	clicked_field[1] = gm_y;
	
	var pos = scr_convert_position_grid(gm_x, gm_y);
	overlay_x = pos[0];
	overlay_y = pos[1];

	if scr_get_owner(gm_x, gm_y) == global.player_number { //clicking on own tower
		
		if multi_select {
			var obj = ds_list_find_value(multi_select_objects, 0);
			if ds_list_size(multi_select_objects) == 0 || field_object.object_index == obj.object_index {
				ds_list_add(multi_select_objects, scr_get_tower(gm_x, gm_y));
			}
			
		} else {
			//set overlay
			var tower_index = scr_get_tower_index(field_object);
			overlay_type = ds_list_find_value(tower_list, tower_index).overlay;
		}
	}
}








