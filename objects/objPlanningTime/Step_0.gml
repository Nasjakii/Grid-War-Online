if left_released && change_val  {
	change_val = false;
	string_val = "";
	clicked_out = true;
}

if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) && left_released {
	change_val = true;
	keyboard_string = "";
}



if change_val || clicked_out {
	image_index = 1;
	string_val = keyboard_string;

	if keyboard_check_released(vk_enter) || clicked_out {
		var new_val = 3;
		if string_digits(string_val) == string_val && string_val != "" {
			var int = real(string_val);
			new_val = clamp(int, min_planning_time , max_planning_time);
		}
		
		string_val = string(new_val);
		global.planning_time = new_val * game_get_speed(gamespeed_fps);
		ini_open("Savefile.ini");
		ini_write_real("Settings", "planning_time",global.planning_time);
		ini_close();
		change_val = false;
		
		clicked_out = false;
	}
} else {
	image_index = 0;
}