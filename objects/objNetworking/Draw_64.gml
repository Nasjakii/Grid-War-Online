

if debug_networking {
	scr_draw_set(fa_right, fa_bottom, c_black);
	draw_set_font(foGUIDebugging);
	draw_text(gui_width - 5, gui_height, "Server: " + string(global.is_host));

	
	if global.is_host {
		draw_text(gui_width - 5, gui_height - 90, "Connected: " + string("a"));
	}
	draw_set_font(foDefault);
	draw_set_halign(fa_left);
}