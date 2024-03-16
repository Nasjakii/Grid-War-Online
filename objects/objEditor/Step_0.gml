var tower_list = objTowers.tower_list_editor;

if keyboard_check_pressed(vk_escape)  {
	show_menu = !show_menu;
}


hover_set = false;


#region multi buy
	var key = scr_get_numkey();
	if key != -1 {
		multi_buy_obj = ds_list_find_value(tower_list, key + 1).object;
	}
	
	if right_released {
		multi_buy_obj = -1;
	}

#endregion

#region multi select
	multi_select = keyboard_check_direct(vk_control); //multi select
	if keyboard_check_released(vk_control) && ds_list_size(multi_select_objects) != 0 {
		overlay_type = "Multi Select";
	}

	if !multi_select && overlay_type != "Multi Select" {
		ds_list_clear(multi_select_objects);
	} 
#endregion


if right_released {
	overlay_type = ""; //close overlay
}



var field_pos = scr_get_field_position();
if !scr_on_field(field_pos[0], field_pos[1]) exit;

var field_object = ds_grid_get(objGrid.field_grid, field_pos[0], field_pos[1]);

if field_object == -1 && multi_buy_obj != -1 && left_released {

	var inst = scr_editor_tower_place(field_pos[0], field_pos[1], multi_buy_obj, selected_player, 0);
	//set image_index
}




if field_object != -1 {
	if left_released {
		var inst = scr_get_tower(field_pos[0], field_pos[1]);
		inst.level = selected_level;
	}

	if right_released {

		var inst = scr_get_tower(field_pos[0], field_pos[1]);
		instance_destroy(inst);
		ds_grid_set(objGrid.field_grid_instances, field_pos[0], field_pos[1], -1);
		ds_grid_set(objGrid.field_grid, field_pos[0], field_pos[1], -1);
		scr_change_tile(field_pos[0], field_pos[1], -1);
	}
}

