//draw destroy timer
if destroy_timer > 0 {
	draw_set_color(c_black);
	draw_rectangle(mouse_gui_x, mouse_gui_y, mouse_gui_x + 100, mouse_gui_y + 20, false);
	draw_set_color(c_red);
	draw_rectangle(mouse_gui_x, mouse_gui_y, mouse_gui_x + (destroy_timer / destroy_duration) * 100, mouse_gui_y + 20, false);
}

if !scr_mouse_gui_in_array(hover_message_box_array) exit;

var xpos = mouse_gui_x + hover_message_offset;
var ypos = mouse_gui_y + hover_message_offset;

draw_set_font(hover_message_font);
var header_str = hover_message_str;
var height = string_height(header_str);
var header_text_xoffset = 10;
var hover_message_width = string_width(header_str) + 100;

draw_sprite_stretched(sprUiTextTitle, 0, xpos, ypos, hover_message_width, height);
draw_set_color(hover_message_text_color);
scr_draw_set(fa_left, fa_top, c_white);
draw_text(header_text_xoffset + mouse_gui_x + hover_message_offset, mouse_gui_y + hover_message_offset, hover_message_str);

if hover_message_tag {
	var padding = 20;
	var tag_width = string_width(hover_message_tag_text) + padding;
	var tag_height = string_height(hover_message_tag_text);
	var tag_x = xpos + hover_message_width - tag_width / 2;
	var tag_y = ypos - tag_height / 2;
	
	scr_draw_set(fa_left, fa_top, c_white);
	draw_sprite_stretched(sprUiTag, 0, tag_x, tag_y, tag_width, tag_height);
	draw_text(tag_x + padding / 2, tag_y, hover_message_tag_text);
	
	hover_message_tag = false;
}

if hover_message_body_active {
	var ygap = 10;
	var text_offset_x = 10;
	var body_y = ypos + ygap + string_height(header_str);
	var padding = 10;
	var str = hover_message_body_str;
	draw_set_font(hover_message_body_font);
	var sep = string_height(str);
	var width = hover_message_width;	


	draw_sprite_stretched(sprUiBubble, 0, xpos, body_y, hover_message_width + 2 * padding, string_height_ext(str, sep, width) + 2 * padding);
	scr_draw_set(fa_left, fa_top, hover_message_body_text_color);
	draw_text_ext(xpos + text_offset_x + padding, body_y + padding, hover_message_body_str, sep, width);
	
	hover_message_body_active = false;
}


hover_set = false;

