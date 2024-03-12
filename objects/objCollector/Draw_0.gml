event_inherited();


if !scr_in_vision_coords(x,y) exit;

if objGame.action_step == 1 {
	var money_gained = 0;
	var pos = scr_convert_position_coordinates(x,y);
	var count = 0;
	for(var i = -vision_range; i <= vision_range; i++){
		for(var i2 = -vision_range; i2 <= vision_range; i2++){
			var inst = ds_grid_get(objGrid.field_grid_instances, clamp(pos[0] + i, 0, objGrid.field_width - 1), clamp(pos[1] + i2, 0, objGrid.field_height - 1));
			//if field empty
			if inst == 0 {
				objPlayer.money += money_per_field;
				money_gained += money_per_field;
				count++;
				
				var part_sys = part_system_create_layer(layer_get_id("Above"), false, psCollector); 
				var half = tile_size / 2;
				var xpos = x + i * tile_size + half;
				var ypos = y + i2 * tile_size + half;
				part_system_position(part_sys, xpos, ypos);
				part_system_angle(part_sys, point_direction(xpos, ypos, x + half, y + half) - 90);
			}
		}
	}
	
	objPlayer.gold_per_turn += money_gained;
	
	
} 

if objGame.action {

	var pos = scr_convert_position_coordinates(x,y);
	for(var i = -vision_range; i <= vision_range; i++){
		for(var i2 = -vision_range; i2 <= vision_range; i2++){
			var inst = ds_grid_get(objGrid.field_grid_instances, clamp(pos[0] + i, 0, objGrid.field_width - 1), clamp(pos[1] + i2, 0, objGrid.field_height - 1));
			if inst == 0 {
				draw_set_color(c_green);
				draw_set_alpha(0.2);
				draw_rectangle(x + i * tile_size, y + i2 * tile_size,
									 x + (i + 1) * tile_size, y + (i2 + 1) * tile_size, false);
				draw_set_alpha(1);
				draw_set_color(c_white);
			}
		}
	}
	
}