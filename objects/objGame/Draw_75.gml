if keyboard_check_released(ord("X")) && !show_menu {
	show_stats = !show_stats;
}

if show_stats {
	//draw_sprite(sprStats, 0, 0,0);
	draw_set_color(c_white);
	draw_rectangle(100, 100, gui_width - 100, gui_height - 100, false);
	
	scr_draw_set(fa_left, fa_top, c_black, foDefaultSmall);

	var towers = objTowers.tower_list;
	for(var i = 0; i < ds_list_size(towers); i++) {
		var struct = ds_list_find_value(towers, i);

		draw_text(200, 200 + 100 * i, struct.name);
		
		var upgrades = struct.upgrades;
		for(var i2 = 0; i2 < array_length(upgrades); i2++) {
			draw_text(300 + 300 * i2, 175 + i * 100, upgrades[i2].variable);
			draw_text(300 + 300 * i2, 200 + i * 100, upgrades[i2].value);
			draw_text(300 + 300 * i2, 225 + i * 100, upgrades[i2].price);
		}
		
	}
	
}




if show_menu {
	draw_set_alpha(0.6);
	draw_set_color(c_dkgray);
	draw_rectangle(0,0,gui_width, gui_height, false);
	draw_set_alpha(1);

	scr_draw_set(fa_center, fa_middle, c_white);
	draw_text(gui_width / 2, 200, "Menu");
	draw_set_halign(fa_left);
	
	#region home button
	var xpos = gui_width - sprite_get_width(sprHomeButton);
	var ypos = 0;
	draw_sprite(sprHomeButton, 0, xpos, ypos);
	var home = point_in_rectangle(mouse_gui_x, mouse_gui_y, xpos, ypos, xpos + sprite_get_width(sprHomeButton), ypos + sprite_get_height(sprHomeButton)) && left_released;
	if home room_goto(Menu);
	#endregion
	
	#region Controlls
	draw_sprite(sprControllTutorial, 0, gui_width - sprite_get_width(sprControllTutorial), gui_height - sprite_get_height(sprControllTutorial));
	#endregion
	
	
}


var game_state = objPlayer.game_state;
if game_state == "lost" || game_state == "won" {
	scr_draw_set(fa_center, fa_middle, c_white, foDefaultBig);

	draw_text(gui_width / 2, gui_height / 2, "You " + objPlayer.game_state);
	objGrid.disable_fog = true;
	
	if global.campaign && game_state == "won" {
		var next = scr_button_gui(sprNextButton, gui_width / 2, gui_height / 2, 1);
		if next {
			var room_index = room_get_name(room)
			room_index = string_delete(room_index, 1, 8);
			var next_room = asset_get_index("Campaign" + string(int64(room_index) + 1));

			show_debug_message(next_room);
			if room_exists(next_room) room_goto(next_room) else room_goto(Menu);

		}
	}
}

if global.is_host && game_running == false {
	scr_draw_set(fa_center, fa_middle, c_white, foGUIDebugging);

	draw_text(gui_width / 2, gui_height / 2, "Press Escape to start with: " + string(player_count) + " Players connected");
}

if !global.is_host && game_running == false {
	scr_draw_set(fa_center, fa_middle, c_white, foGUIDebugging);

	draw_text(gui_width / 2, gui_height / 2, "Waiting for Server to start");
}




//draw_sprite_part(sprTimer, 0, 0,0,sprite_get_width(sprTimer) / (planning_time + action_time) * timer, sprite_get_height(sprTimer), 0, 0);

var width = gui_width / 3;

scr_draw_set(fa_left, fa_top, c_black, foGUIDebugging);
if debugging {
	draw_text(width + 10, 40, string(timer));
	draw_text(width + 200, 40, string(timer_counting));
	draw_text(width + 300, 40, string(objGUI.overlay_type));
}







