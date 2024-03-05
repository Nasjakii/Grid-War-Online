

if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) && left_released {
	
	window_set_fullscreen(!window_get_fullscreen());
	ini_open("Savefile.ini");
	ini_write_real("Settings","fullscreen", window_get_fullscreen());
	ini_close();
	image_index++;
}

