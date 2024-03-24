if !global.is_host exit;

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
	if allow_digits && allow_text string_val = string_lettersdigits(keyboard_string);
	else if allow_digits string_val = string_digits(keyboard_string);
	else if allow_text string_val = string_letters(keyboard_string);

	if keyboard_check_released(vk_enter) || clicked_out {
		var new_val = 640;
		if string_digits(string_val) == string_val && string_val != "" {
			var int = real(string_val);
			var remainder = int mod tile_size;
			new_val = clamp(int - remainder, min_room_size ,max_room_size);
		}
		
		string_val = string(new_val);
		objLobby.room_size = new_val;
		objLobby.values_changed = true;
		
		change_val = false;
		clicked_out = false;
	}
} else {
	image_index = 0;
}