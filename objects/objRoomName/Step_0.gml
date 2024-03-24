if left_released && change_val {
	change_val = false;
	string_val = "";
	clicked_out = true;
}

if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) && left_released {
	change_val = true;
}

if string_length(keyboard_string) >= string_length_max keyboard_string = string_val;
if change_val || clicked_out  {
	image_index = 1;
	
	if allow_digits && allow_text string_val = string_lettersdigits(keyboard_string);
	else if allow_digits string_val = string_digits(keyboard_string);
	else if allow_text string_val = string_letters(keyboard_string);

	if keyboard_check_released(vk_enter) || clicked_out {
		show_debug_message(string_val);
		
		change_val = false;
		clicked_out = false;
	}
} else {
	image_index = 0;
}