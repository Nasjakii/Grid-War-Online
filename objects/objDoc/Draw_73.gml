
if !scr_in_vision_coords(x,y) exit;

if objGame.action_step == 1 {
	ds_list_clear(repair_list);

	var pos = scr_convert_position_coordinates(x,y);
	for(var i = -vision_range; i <= vision_range; i++){
		for(var i2 = -vision_range; i2 <= vision_range; i2++){
			var inst = ds_grid_get(objGrid.field_grid_instances, clamp(pos[0] + i, 0, objGrid.field_width - 1), clamp(pos[1] + i2, 0, objGrid.field_height - 1));
			if inst <= 0 || !instance_exists(inst) || inst == id continue;
			if inst.hp < inst.hp_max && inst.player_number == player_number {
				inst.hp = min(inst.hp + repair_amount, inst.hp_max);
				ds_list_add(repair_list, inst);
			}
		}
	}
} 

if objGame.action {

	for(var i = 0; i < ds_list_size(repair_list); i++) {
		var inst = ds_list_find_value(repair_list, i);
		if instance_exists(inst) {
			draw_set_alpha(0.4);
			draw_rectangle_color(inst.bbox_left, inst.bbox_top, inst.bbox_right, inst.bbox_bottom, c_green, c_green, c_green, c_green, false);
			draw_set_alpha(1);
		}
	}
	
}