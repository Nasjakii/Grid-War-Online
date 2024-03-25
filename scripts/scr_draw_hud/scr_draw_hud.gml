
function scr_draw_hud(money, towers){
	
	var tower_count = ds_list_size(towers);

	var gap_size = 10;
	var img_size = 72;
	var hud_size = (img_size + gap_size) * tower_count + gap_size;
	var y_offset = gui_height / 2 - hud_size / 2;

	draw_sprite_stretched(sprHUDTowers, 0, 0, y_offset, img_size + gap_size * 2, hud_size);

	for(var i = 0; i < tower_count; i++) {
		var _tower = ds_list_find_value(towers, i);
	
		var spr = _tower.sprite;
		var name = _tower.name;
		var price = _tower.price;
	
		var x1 = gap_size;
		var y1 = i * (img_size + gap_size) + y_offset + gap_size;
		var x2 = x1 + img_size;
		var y2 = y1 + img_size;
	
	
	
		if money < price {
			draw_set_color(c_maroon);
			draw_set_alpha(0.5);
			draw_rectangle(x1, y1, x2, y2, false);
		}
		draw_set_alpha(1);
		scr_draw_set(fa_right, fa_top, c_black)
		draw_rectangle(x1, y1, x2, y2, true);
		draw_sprite_stretched(spr, 0, x1 - sprite_get_xoffset(spr), y1 - sprite_get_yoffset(spr), img_size, img_size);
	
		var arr = [x1, y1, x2, y2];
		if !hover_set && scr_mouse_gui_in_array(arr) {
		
			draw_set_color(c_white);
			draw_rectangle(x1, y1, x2, y2, true);
		
			scr_hover_text_header(arr, name, c_black, foDefaultBig);
			scr_hover_text_tag(_tower.price);
			scr_hover_text_body(_tower.description, c_black, foDefault);
			hover_set = true;
		
			if left_released && money > price {
				multi_buy_obj = ds_list_find_value(towers, i).object;
				overlay_type = "Multi-Buy";
			}
		}
	}

}