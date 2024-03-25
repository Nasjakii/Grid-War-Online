
#region show gui Messages

if gui_message_timer > 0 {
	gui_message_timer--;
	

	scr_draw_set(fa_center, fa_top, c_red, foGUIBig);
	draw_text(gui_width / 2, gui_height / 10, gui_message);
	scr_draw_set(fa_left, fa_top, c_white);

} else {
	gui_message = "";
}

#endregion