
function scr_hover_text_header(box_arr, str, text_color, font, offset = 20){
	
	draw_set_font(font);
	hover_message_box_array = box_arr;
	hover_message_str = str;
	hover_message_text_color = text_color;
	hover_message_font = font;
	hover_message_offset = offset;
	
}


function scr_hover_text_body(str, text_color, font){

	hover_message_body = true;
	hover_message_body_str = str;
	hover_message_body_text_color = c_black;
	hover_message_body_font = font;
	
}