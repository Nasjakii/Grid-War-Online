if left_released && change_val {
	change_val = false;
	string_val = "";
	clicked_out = true;
}

if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) && left_released {
	change_val = true;
	keyboard_string = "";
}


if change_val || clicked_out{
	image_index = 1;
	string_val = keyboard_string;

	if keyboard_check_released(vk_enter) || clicked_out {
		var new_val = 640;
		if string_digits(string_val) == string_val && string_val != "" {
			var int = real(string_val);
			var remainder = int mod tile_size;
			new_val = clamp(int - remainder, min_room_size ,max_room_size);
		}
		
		string_val = string(new_val);
		global.room_size = new_val;
		ini_open("Savefile.ini");
		ini_write_real("Settings", "room_size", global.room_size);
		ini_close(); 
		
		change_val = false;
		clicked_out = false;
	}
} else {
	image_index = 0;
}