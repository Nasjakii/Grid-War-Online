
var towers = objTowers.tower_list;
var tower_count = ds_list_size(towers);

for (var i = 0; i < tower_count; ++i) { //hotkeys for towers
    if keyboard_check_pressed(ord(string(i + 1))) {
		var obj = ds_list_find_value(objTowers.tower_list, i).object;
		multi_buy_obj = obj;
	}
}

multi_select = keyboard_check_direct(vk_control); //multi select
if keyboard_check_released(vk_control) && ds_list_size(multi_select_objects) != 0 {
	overlay_type = "Multi Select";
}
if !multi_select && overlay_type != "Multi Select" {
	ds_list_clear(multi_select_objects);
} 


if right_released {
	multi_buy_obj = -1;
}
if right_released || !overlay_gui_hovered && left_released {
	overlay_type = ""; //close overlay
}


var field_pos = scr_get_field_position();
if !scr_on_field() exit;
if !scr_in_vision_grid(field_pos[0], field_pos[1]) exit;

var field_object = ds_grid_get(objGame.field_grid, field_pos[0], field_pos[1]);
if mouse_check_button_released(mb_left) && overlay_type = "" { //open tower overlay

	clicked_field[0] = field_pos[0];
	clicked_field[1] = field_pos[1];
	
	var pos = scr_convert_position_grid(field_pos[0], field_pos[1]);
	overlay_x = pos[0];
	overlay_y = pos[1];
	
	
	if field_object == -1 { //empty field
		overlay_type = "Multi-Buy"
	}
	

	if scr_get_owner(field_pos[0], field_pos[1]) == global.player_number { //clicking on own tower
		
		if multi_select {
			var obj = ds_list_find_value(multi_select_objects, 0);
			if ds_list_size(multi_select_objects) == 0 || field_object.object_index == obj.object_index {
				ds_list_add(multi_select_objects, scr_get_tower(field_pos[0], field_pos[1]));
			}
			
		} else {
			
			var towers = objTowers.tower_list;
			for(var i = 0; i < ds_list_size(towers); i++) {
				var struct = ds_list_find_value(towers, i);
				if struct.object == field_object {
					overlay_type = struct.overlay;
				}
			}

			

		}
	}
}








