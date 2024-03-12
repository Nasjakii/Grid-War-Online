
function scr_hotkeys_towers(towers){

	var tower_count = ds_list_size(towers);

	for (var i = 0; i < tower_count; ++i) { //hotkeys for towers
	    if keyboard_check_pressed(ord(string(i + 1))) {
			multi_buy_obj = ds_list_find_value(towers, i).object;

		}
	}

}