


if multi_buy_obj != -1 { //showing multi buy object at mouse
	var posF = scr_get_field_position();
	var pos = scr_convert_position_grid(posF[0], posF[1])
	draw_sprite_ext(object_get_sprite(multi_buy_obj), 0, pos[0], pos[1], 1, 1, 0, c_blue, 0.5);
}



