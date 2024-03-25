

if box_transition_timer > 0 {
	draw_set_alpha(box_transition_timer / box_transition_duration);
	draw_set_color(c_black);
	draw_rectangle(0,0, gui_width, gui_height, false);
	box_transition_timer--;
	draw_set_alpha(1);
}

