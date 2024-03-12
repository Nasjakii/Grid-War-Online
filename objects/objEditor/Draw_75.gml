
if keyboard_check_pressed(vk_escape) {
	show_menu = !show_menu;
}


if show_menu {
	draw_set_alpha(0.6);
	draw_set_color(c_dkgray);
	draw_rectangle(0,0,gui_width, gui_height, false);
	draw_set_alpha(1);

	scr_draw_set(fa_center, fa_middle, c_white);
	draw_text(gui_width / 2, 200, "Menu");
	draw_set_halign(fa_left);
	
	#region home button
	var xpos = gui_width - sprite_get_width(sprHomeButton);
	var ypos = 0;
	draw_sprite(sprHomeButton, 0, xpos, ypos);
	var home = point_in_rectangle(mouse_gui_x, mouse_gui_y, xpos, ypos, xpos + sprite_get_width(sprHomeButton), ypos + sprite_get_height(sprHomeButton)) && left_released;
	if home room_goto(Menu);
	#endregion
	
	#region Controlls
	draw_sprite(sprControllTutorial, 0, gui_width - sprite_get_width(sprControllTutorial), gui_height - sprite_get_height(sprControllTutorial));
	#endregion
	
	
}







