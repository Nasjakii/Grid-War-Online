
if overlay_type == "Striker" {
	
	var striker_inst = ds_grid_get(objGame.field_grid_instances, clicked_field[0], clicked_field[1]);
	if  instance_exists(striker_inst) && striker_inst.object_index == objStriker {
		var tile_s = tile_size;
		var x1 = striker_inst.target_field_x * tile_s;
		var y1 = striker_inst.target_field_y * tile_s;
		draw_set_color(c_aqua);
		draw_set_alpha(0.4);
		for(var i = -striker_inst.missile_aoe; i <= striker_inst.missile_aoe; i++) {
			for(var i2 = -striker_inst.missile_aoe; i2 <= striker_inst.missile_aoe; i2++) {
	
				draw_rectangle(x1 + i * tile_s,
							   y1 + i2 * tile_s,
							   x1 + tile_s + i * tile_s,
							   y1 + tile_s + i2 * tile_s, false);
			}
		}
		draw_set_color(c_white);
		draw_set_alpha(1);
	}
}

if multi_buy_obj != -1 { //showing multi buy object at mouse
	var posF = scr_get_field_position();
	var pos = scr_convert_position_grid(posF[0], posF[1])
	draw_sprite_ext(object_get_sprite(multi_buy_obj), 0, pos[0], pos[1], 1, 1, 0, c_blue, 0.5);
}

var multi_count = ds_list_size(multi_select_objects);
if multi_count > 0 {
	for (var i = 0; i < multi_count; ++i) {
		var inst = ds_list_find_value(multi_select_objects, i);
	    draw_circle(inst.x, inst.y, 5, false);
	}
}









