if scr_in_vision_coords(x,y) || player_number == global.player_number || global.bullets_show_always {
	draw_self();
}


if draw_shrapnel {
	draw_set_color(c_white);
	draw_line(x1, y1, x2, y2);
	draw_set_color(c_red);
	draw_line(x1, y1, x3, y3);
	draw_set_color(c_blue);
	draw_line(x1, y1, x4, y4);
	draw_set_color(c_white);
}
