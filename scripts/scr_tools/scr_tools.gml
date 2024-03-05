function scr_mouse_in_array(arr){
	return point_in_rectangle(mouse_x, mouse_y, arr[0], arr[1], arr[2], arr[3]);
}

function scr_mouse_gui_in_array(arr){
	return point_in_rectangle(mouse_gui_x, mouse_gui_y, arr[0], arr[1], arr[2], arr[3]);
}

function scr_draw_rectangle(arr, outline = false) {
	draw_rectangle(arr[0], arr[1], arr[2], arr[3], outline);
}