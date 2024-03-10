function scr_get_overlay_values(o_width, o_height, x_add = 0) {
	//camera values
	var cam = view_camera[0];
	var mid_x = tile_size / 2;
	var view_x = camera_get_view_x(cam);
	var view_y = camera_get_view_y(cam);
	
	//position on gui (changes every step)
	var arr = [];
	arr[0] = (overlay_x + mid_x - o_width / 2 - view_x + x_add) * gui_scale;
	arr[2] = (overlay_x + mid_x + o_width / 2 - view_x + x_add) * gui_scale;
	arr[1] = (overlay_y -		  o_height    - view_y) * gui_scale;
	arr[3] = (overlay_y						  - view_y) * gui_scale;
	
	return arr;
	
}


function scr_overlay_buy(pos){
	
	var inst = ds_grid_get(objGame.field_grid_instances, clicked_field[0], clicked_field[1]);
	if inst != 0 {
		overlay_type = "";
		return;
	}
	
	scr_draw_rectangle(pos);
	

	//Resize sprites
	var image_scale = 2 * gui_scale;
	var spr_size = sprite_get_width(sprBase) * image_scale;
	
	var towers = objTowers.tower_list;
	var towers_count = ds_list_size(towers);
	
	//hitboxes to buy towers
	for(var i = 0; i < towers_count; i++) {
		
		//Sprite
		var xpos = pos[0] + overlay_offset * gui_scale + (overlay_offset * gui_scale + spr_size) * i;
		var ypos = pos[1] + overlay_offset * gui_scale;
		draw_sprite_ext(ds_list_find_value(towers, i).sprite, 0, xpos, ypos, image_scale, image_scale, 0, c_white,1);
		
		//Price
		var font_size = gui_scale * 0.3;
		
		scr_draw_set(fa_right, fa_top, c_black);
		draw_set_font(foRescalingGUI);
		draw_text_transformed(xpos + spr_size,ypos - 3 * gui_scale,string(ds_list_find_value(towers, i).price) + "$", font_size, font_size, 0);
		draw_set_color(c_white);
		
		//Name
		scr_draw_set(fa_center, fa_middle, c_black);
		draw_text_transformed(xpos + spr_size / 2,ypos + spr_size + 2 * gui_scale,ds_list_find_value(towers, i).name, font_size, font_size, 0);
		draw_set_color(c_white);
		
		

		//Hitbox
		var hover = point_in_rectangle(mouse_gui_x, mouse_gui_y, xpos, ypos, xpos + spr_size, ypos + spr_size);
		if hover && left_released {
			var obj = ds_list_find_value(towers, i).object;
			scr_buy(obj, clicked_field[0], clicked_field[1]);
			
			if keyboard_check(vk_shift) {
				multi_buy_obj = obj; 
				overlay_type = "Multi-Buy";
			}
			
		}
	}
	
}
	
function scr_overlay_upgrade(pos) {
	
		//draw upgrade 
		draw_sprite_ext(sprUpgrade, 0, pos[0], pos[1], gui_scale, gui_scale, 0, c_white, 1);
		
		var inst = scr_get_tower(clicked_field[0], clicked_field[1]);
		if inst == -1 {
			overlay_type = "";
			return;
		}
		
		var tower_index = scr_get_tower_index(inst);
		var max_level = scr_get_tower_level_max(inst, tower_index);	
		var _upgrade = scr_get_tower_upgrade(tower_index, inst.level);

		//is at max level ?
		if inst.level >= max_level {
			var font_size = gui_scale * 0.3;
			scr_draw_set(fa_right, fa_bottom, c_black);
			draw_text_transformed(pos[2], pos[1], "Max Level", font_size, font_size, 0);
			return;
		}
		
		
		//level and price of tower
		draw_set_font(foDefault);
		var font_size = gui_scale * 0.3;
		scr_draw_set(fa_center, fa_middle, c_white);
		var level_str = string("lvl " + string(inst.level));
		draw_sprite_ext(sprGUITag, 1, pos[0], pos[1], string_width(level_str) * gui_scale * 0.02, gui_scale * 0.9, 0, c_white, 1);
		draw_text_transformed(pos[0], pos[1], level_str, font_size, font_size, 0);
		scr_draw_set(fa_center, fa_middle, c_white);
		var price_str = string(_upgrade.price);
		draw_sprite_ext(sprGUITag, 0, pos[0] + 32 * gui_scale, pos[1], string_width(price_str) * gui_scale * 0.02, gui_scale * 0.9, 0, c_white, 1);
		draw_text_transformed(pos[2], pos[1], price_str, font_size, font_size, 0);
		

		//upgrading
		var upgrade_clicked = (scr_mouse_gui_in_array(pos) && mouse_check_button_pressed(mb_left));
		if upgrade_clicked {
			
			var i = -1;
			do {
				i++;
				if ds_list_size(multi_select_objects) != 0 {
					inst = ds_list_find_value(multi_select_objects, i);
				}
				
				var tower_index = scr_get_tower_index(inst);
				var _upgrade = scr_get_tower_upgrade(tower_index, inst.level);
				var max_level = scr_get_tower_level_max(inst, tower_index);
				var f_pos = scr_get_tower_position(inst);
				if scr_get_upgrade_possible(inst, _upgrade, max_level) {
					objPlayer.money -= _upgrade.price;
					scr_update_tower(f_pos[0], f_pos[1], _upgrade.variable, _upgrade.value, true);
				} 
				
			} until (i >= ds_list_size(multi_select_objects) - 1);
			
		}
		
}
	
	
function scr_overlay_cannon(pos) {
	
		scr_draw_rectangle(pos);

		
		var inst = ds_grid_get(objGame.field_grid_instances, clicked_field[0], clicked_field[1]);
		if inst <= 0 || !instance_exists(inst) {
			overlay_type = "";
			return;
		}
		var conf = inst.image_index;
		draw_sprite_ext(sprCannonControll, conf, pos[0], pos[1], gui_scale, gui_scale, 0, c_white, 1);
		
		var button_size = 13 * gui_scale;
		var offset = 2 * gui_scale;
		var gap = 3 * gui_scale;
		for(var i = 0; i < 3; i++) {
			for(var i2 = 0; i2 < 3; i2++) {
				var _x1 = pos[0] + (button_size + gap) * i + offset;
				var _y1 = pos[1] + (button_size + gap) * i2 + offset;
				var _x2 = pos[0] + button_size * (i + 1) + offset + gap * i;
				var _y2 = pos[1] + button_size * (i2 + 1) + offset + gap * i2;
				//draw_set_color(c_red)
				//draw_rectangle(_x1, _y1, _x2, _y2, true);
				if point_in_rectangle(mouse_gui_x, mouse_gui_y, _x1, _y1, _x2, _y2) && left_released {

					var ang = 0;
					if i == 0 && i2 == 0 ang = 2;
					if i == 1 && i2 == 0 ang = 1;
					if i == 2 && i2 == 0 ang = 8;
					if i == 0 && i2 == 1 ang = 3;
					if i == 1 && i2 == 1 ang = 0;
					if i == 2 && i2 == 1 ang = 7;
					if i == 0 && i2 == 2 ang = 4;
					if i == 1 && i2 == 2 ang = 5;
					if i == 2 && i2 == 2 ang = 6;
					
					scr_update_tower(clicked_field[0], clicked_field[1], "image_index", ang);
					overlay_type = ""; //close overlay
				}
			}
		}
}

function scr_overlay_striker(pos) {
	
		
		draw_sprite_ext(sprStikerControll, 0, pos[0], pos[1], gui_scale, gui_scale, 0, c_white, 1);
		

		if scr_mouse_gui_in_array(pos) && left_released {		
			instance_create_depth(mouse_x,mouse_y,layer_get_depth("Tower"), objTargetSetter, {call_pos : clicked_field});
			overlay_type = ""; //close overlay
				
		}
		
}
