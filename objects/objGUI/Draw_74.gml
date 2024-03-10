
switch(overlay_type) {
	case("Multi-Buy"):
		if left_released {


			var mouse_pos = scr_convert_position_coordinates(mouse_x, mouse_y);
			
			
			if !ds_grid_get(objGame.field_grid_vision, mouse_pos[0], mouse_pos[1]) break;
			if 0 != ds_grid_get(objGame.field_grid_instances, mouse_pos[0], mouse_pos[1]) break;
			
			scr_buy(multi_buy_obj, mouse_pos[0], mouse_pos[1]);
		}
	break;
	case("Upgrade"):
	
		var overlay_width = sprite_get_width(sprUpgrade);
		var overlay_height = sprite_get_height(sprUpgrade);
		var pos = scr_get_overlay_values(overlay_width, overlay_height);
		
		overlay_gui_hovered = scr_mouse_gui_in_array(pos);
		scr_overlay_upgrade(pos);
		
		
		
	break;
	case("Cannon"):
		
		//2 overlays in 1
		var hovered1 = false;
		var hovered2 = false;
		
		//overlay 1
		var overlay_width = sprite_get_width(sprCannonControll);
		var overlay_height = sprite_get_height(sprCannonControll);
		var pos = scr_get_overlay_values(overlay_width, overlay_height);
		
		hovered1 = scr_mouse_gui_in_array(pos);
		scr_overlay_cannon(pos);

		//overlay 2
		var overlay_width = sprite_get_width(sprUpgrade);
		var overlay_height = sprite_get_height(sprUpgrade);
		var pos = scr_get_overlay_values(overlay_width, overlay_height, 50);
		
		hovered2 = scr_mouse_gui_in_array(pos);
		scr_overlay_upgrade(pos);
		
		
		//any of them hovered
		overlay_gui_hovered = hovered1 || hovered2;
		
	break;
	case("Striker"):
		
		//2 overlays in 1
		var hovered1 = false;
		var hovered2 = false;
		
		//overlay 1
		var overlay_width = sprite_get_width(sprStikerControll);
		var overlay_height = sprite_get_height(sprStikerControll);
		var pos = scr_get_overlay_values(overlay_width, overlay_height);
		
		hovered1 = scr_mouse_gui_in_array(pos);
		scr_overlay_striker(pos);

		//overlay 2
		var overlay_width = sprite_get_width(sprUpgrade);
		var overlay_height = sprite_get_height(sprUpgrade);
		var pos = scr_get_overlay_values(overlay_width, overlay_height, 50);
		
		hovered2 = scr_mouse_gui_in_array(pos);
		scr_overlay_upgrade(pos);
		
		
		//any of them hovered
		overlay_gui_hovered = hovered1 || hovered2;
		
	break;
	case("Banger"):
		
		//2 overlays in 1
		var hovered1 = false;
		var hovered2 = false;
		
		//overlay 1
		var overlay_width = sprite_get_width(sprCannonControll);
		var overlay_height = sprite_get_height(sprCannonControll);
		var pos = scr_get_overlay_values(overlay_width, overlay_height);
		
		hovered1 = scr_mouse_gui_in_array(pos);
		scr_overlay_cannon(pos);

		//overlay 2
		var overlay_width = sprite_get_width(sprUpgrade);
		var overlay_height = sprite_get_height(sprUpgrade);
		var pos = scr_get_overlay_values(overlay_width, overlay_height, 50);
		
		hovered2 = scr_mouse_gui_in_array(pos);
		scr_overlay_upgrade(pos);
		
		
		//any of them hovered
		overlay_gui_hovered = hovered1 || hovered2;
		
	break;
	case("Multi Select"):
		var last_inst = ds_list_find_value(multi_select_objects, ds_list_size(multi_select_objects) - 1);
		overlay_x = last_inst.x;
		overlay_y = last_inst.y;
		
		var overlay_width = sprite_get_width(sprUpgrade);
		var overlay_height = sprite_get_height(sprUpgrade);
		var pos = scr_get_overlay_values(overlay_width, overlay_height);
		
		hovered1 = scr_mouse_gui_in_array(pos);
		scr_overlay_upgrade(pos);
		
		overlay_gui_hovered = hovered1;
	break;
}




var towers = objTowers.tower_list;
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
	
	
	
	if objPlayer.money < price {
		draw_set_color(c_maroon);
		draw_set_alpha(0.5);
		draw_rectangle(x1, y1, x2, y2, false);
	}
	scr_draw_set(fa_right, fa_top, c_black, 1)
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
		
		if left_released && objPlayer.money > price {
			multi_buy_obj = ds_list_find_value(towers, i).object;
			overlay_type = "Multi-Buy";
		}
	}
}




