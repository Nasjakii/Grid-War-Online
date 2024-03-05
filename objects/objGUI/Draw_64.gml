

if !scr_mouse_gui_in_array(hover_message_box_array) exit;

var xpos = mouse_gui_x + hover_message_offset;
var ypos = mouse_gui_y + hover_message_offset;
var header_str = hover_message_str;

scr_draw_set(fa_left, fa_top, hover_message_box_color);
draw_set_font(hover_message_font);
draw_rectangle(xpos, ypos, xpos + hover_message_width, mouse_gui_y + string_height(header_str) + hover_message_offset, false);
draw_set_color(hover_message_text_color);

draw_text(mouse_gui_x + hover_message_offset, mouse_gui_y + hover_message_offset, hover_message_str);

if hover_message_body {
	var ygap = 30;
	var body_y = ypos + ygap + string_height(header_str);
	
	var str = hover_message_body_str;
	draw_rectangle(xpos, body_y, xpos + hover_message_width, body_y + string_height(hover_message_body_str), false);
	
	draw_set_color(hover_message_body_box_color);
	draw_set_font(hover_message_body_font);
	draw_text_ext(xpos, body_y, hover_message_body_str, string_height(str), hover_message_width);
	
	hover_message_body = false;
}


hover_set = false;

