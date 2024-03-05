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
	if keyboard_check(vk_control) && keyboard_check_pressed(ord("V")){
		string_val = clipboard_get_text();
		keyboard_string = string_val;
	}

	if keyboard_check_released(vk_enter) || clicked_out {

		ip = string_val;
		ini_open("Savefile.ini");
		ini_write_string("Settings", "IP4", ip);
		ini_close();
		
		change_val = false;
		clicked_out = false;
	}
} else {
	image_index = 0;
}