
draw_set_font(foDefault);
scr_draw_set(fa_left, fa_top, c_white);
for(var i = 0; i < array_length(map_names); i++) {
	var map_name = map_names[i];
	var width = string_width(map_name);
	var height = string_height(map_name);
	
	
	var xpos =  200;
	var ypos = 100 + 100 * i;
	draw_set_color(c_white)
	draw_text(xpos, ypos, map_name);
	draw_rectangle(xpos, ypos, xpos + width, ypos + height, true);
	
	if point_in_rectangle(mouse_x, mouse_y, xpos, ypos, xpos + width, ypos + height) && left_released {
		show_debug_message(file_names[i]);
		room_set_width(EditorRoom, map_sizes[i]);
		room_set_height(EditorRoom, map_sizes[i]);
		global.map_file_name = file_names[i];
		room_goto(EditorRoom);
		break;
	}
	
	draw_sprite_stretched(sprExitButton, 0, xpos + width, ypos, height, height);
	draw_rectangle(xpos + width, ypos, xpos + width + height, ypos + height, true);
	if point_in_rectangle(mouse_x, mouse_y, xpos + width, ypos, xpos + width + height, ypos + height) && left_released {
		file_delete(working_directory + "/Maps/" + file_names[i]);
		
		array_delete(map_names, i, 1);
		array_delete(map_sizes, i, 1);
		array_delete(file_names, i, 1);
	}
	
}



