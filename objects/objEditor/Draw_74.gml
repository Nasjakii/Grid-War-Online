

scr_draw_hud(999999, objTowers.tower_list_editor);


draw_set_color(c_white);
var pos_arr = [gui_width - 100, 0, gui_width, 100];

draw_sprite_stretched(sprSaveFile, 0, pos_arr[0], pos_arr[1], 100,100);
if scr_mouse_gui_in_array(pos_arr) {
	draw_sprite_stretched(sprSaveFile, 1, pos_arr[0], pos_arr[1], 100,100);

	if left_released {
		
		scr_save_map(objPersistent.map_file_editor, map_name, map_size);
		
		room_goto(Menu);
	}
}


