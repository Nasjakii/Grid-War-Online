



draw_set_font(foDefault);
scr_draw_set(fa_center, fa_bottom, c_white);
draw_text(x + sprite_width / 2, bbox_top - 5, "Win By");

draw_sprite(sprite_index,0,x,y);
scr_draw_set(fa_left, fa_middle, c_white);
draw_text(x + 20,y + sprite_height / 2, picked);

if !global.is_host || !clickable exit;

if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) && left_released {
	extended = !extended;
}

var click = -1;

if extended {
	with(objUIParent) {
		clickable = false;
	}

	for(var i = 1; i <= array_length(options); i++){
		
		if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top + sprite_height * i, bbox_right, bbox_bottom + sprite_height * i) {
			draw_sprite(sprite_index,1,x,y + sprite_height * i);
			if left_released {
				
				click = i;
				extended = false;
			}
		} else {
			draw_sprite(sprite_index,0,x,y + sprite_height * i);
		}
		
		scr_draw_set(fa_left, fa_middle, c_white);
		draw_text(x + 20,y + sprite_height / 2 + i * sprite_height, options[i - 1]);
	}
}


if click >= 1 {
	objLobby.win_option = options[click - 1];
	picked = objLobby.win_option;
	objLobby.values_changed = true;
}


draw_set_valign(fa_top);