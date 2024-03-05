

if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) && left_released {
	
	global.bullets_show_always = !global.bullets_show_always;
	ini_open("Savefile.ini");
	ini_write_real("Settings","bullets_show_always", global.bullets_show_always);
	ini_close();
	image_index++;
}

