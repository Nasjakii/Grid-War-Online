


if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) {
	image_index = 1;
	if left_released {
		if room = Menu room_goto(Settings); else if room = Settings room_goto(Menu);
	}
} else {
	image_index = 0;
}