function scr_draw_hp_bar(offset = 2, outline = 1){
	if hp != hp_max && hp > 0 {
		var width = bbox_right - bbox_left - offset * 2;
		draw_line_width_color(bbox_left + offset - outline,bbox_bottom - offset, bbox_right - offset + outline, bbox_bottom - offset, 2 + outline * 2, c_black, c_black);
		draw_line_width_color(bbox_left + offset,bbox_bottom - offset, bbox_right - offset                   , bbox_bottom - offset, 2, c_gray, c_gray);
		draw_line_width_color(bbox_left + offset,bbox_bottom - offset, bbox_left + offset + width * hp/hp_max, bbox_bottom - offset, 2, c_red, c_red);
	}
}