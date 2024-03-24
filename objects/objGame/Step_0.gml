


if keyboard_check_pressed(vk_escape) && objGUI.overlay_type == "" {
	show_menu = !show_menu;
	
	if global.is_host scr_game_set_running(!game_running);
		
}


#region debugging
if keyboard_check_released(vk_f1) {
	debugging = !debugging;
}

if debugging {
	//show_debug_log(true);
	

	if keyboard_check_released(vk_f12) {
		objGrid.draw_grid = !objGrid.draw_grid;
	}


	if keyboard_check_released(vk_f5) {
		objGrid.disable_fog = !objGrid.disable_fog;
	}
	if keyboard_check_released(vk_f3) {
		objPlayer.money += 10000;
	}


	if keyboard_check(vk_f2) {
		game_set_speed(800, gamespeed_fps);
	} else {
		game_set_speed(60, gamespeed_fps);
	}
}

#endregion

#region timer


if game_running {
	timer_counting += delta_time/1000000*game_get_speed(gamespeed_fps);
	timer = timer_counting mod (planning_time + action_time);
}



planning = timer <= planning_time;
action = timer > planning_time && timer < planning_time + action_time;


if (action) action_step++ else action_step = 0;


#endregion

#region action order 

if action_step == 1 {
	
	//create list of planned object with positions OPTIMIZATION
	
	//create objects
	for(var i = 0; i < ds_grid_width(objGrid.field_grid_planned_objects); i++) {
		for(var i2 = 0; i2 < ds_grid_height(objGrid.field_grid_planned_objects); i2++) {
			
			var object = ds_grid_get(objGrid.field_grid_planned_objects, i, i2);
			if object != -1 {
				scr_tower_create(object, i, i2);
			}
		}
	}
}

#endregion


#region first start

if first_start && game_running {
	first_start = false;
	
	scr_initialize_players();
	
	if global.is_host scr_initialize_neutrals();
}

#endregion

