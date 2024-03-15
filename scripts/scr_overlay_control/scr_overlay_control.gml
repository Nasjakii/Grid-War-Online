
function scr_overlay_control(type, money){
	switch(type) {
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
			overlay_width = sprite_get_width(sprUpgrade);
			overlay_height = sprite_get_height(sprUpgrade);
			pos = scr_get_overlay_values(overlay_width, overlay_height, 50);
		
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
			overlay_width = sprite_get_width(sprUpgrade);
			overlay_height = sprite_get_height(sprUpgrade);
			pos = scr_get_overlay_values(overlay_width, overlay_height, 50);
		
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
			overlay_width = sprite_get_width(sprCannonControll);
			overlay_height = sprite_get_height(sprCannonControll);
			pos = scr_get_overlay_values(overlay_width, overlay_height);
		
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


}