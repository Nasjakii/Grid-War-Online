


if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) {
	image_index = 1;
	if left_released {
		room_goto(Campaign0);
		global.campaign = true;
		global.is_host = true;
		global.player_number = 0;
		global.win_option = "Bases";
		
	}
} else {
	image_index = 0;
}