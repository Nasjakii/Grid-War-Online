
image_angle = direction -90;
image_index = player_number;

if global.player_number == 2 {
	image_index = 1;
}

if objGame.action && !draw_shrapnel {
	speed = base_speed;
} else {
	speed = 0;
}

//speed just not to get the error message of out of grid size
if x <= speed || x >= room_width - speed || y <= speed || y >= room_height - speed  {
	instance_destroy(self);
}

if place_meeting(x,y,objTowerParent) {
	var inst = instance_place(x,y,objTowerParent);

	if inst.player_number != player_number {

		var part_sys = part_system_create_layer(layer_get_id("Above"), false, psShrapnel); 
		part_system_position(part_sys,x,y);
		part_system_angle(part_sys, image_angle);
		
		
		
		
		draw_shrapnel = true;
		x1 = x + lengthdir_x(shrapnel_split, direction);
		y1 = y + lengthdir_y(shrapnel_split, direction);
		
		x2 = x1 + lengthdir_x(shrapnel_range, direction - shrapnel_angle);
		y2 = y1 + lengthdir_y(shrapnel_range, direction - shrapnel_angle);
		
		x3 = x1 + lengthdir_x(shrapnel_range, direction);
		y3 = y1 + lengthdir_y(shrapnel_range, direction);
		
		x4 = x1 + lengthdir_x(shrapnel_range, direction + shrapnel_angle);
		y4 = y1 + lengthdir_y(shrapnel_range, direction + shrapnel_angle);
		
		var collision_list = ds_list_create();
		collision_line_list(x1, y1, x2, y2, objTowerParent, true, true, collision_list, false);
		collision_line_list(x1, y1, x3, y3, objTowerParent, true, true, collision_list, false);
		collision_line_list(x1, y1, x4, y4, objTowerParent, true, true, collision_list, false);
		//check for duplicated before

		
		var clear_list = ds_list_create();
		//deal damage
		for(var i = 0; i < ds_list_size(collision_list); i++) {
			var inst = ds_list_find_value(collision_list, i);
			

			if ds_list_find_index(clear_list, inst) != -1 || inst.player_number == player_number continue;
			ds_list_add(clear_list, inst);
			inst.hp -= damage;
			var field_pos = scr_convert_position_coordinates(inst.x,inst.y);
			scr_update_tower(field_pos[0], field_pos[1],"hp",inst.hp);
		}
		ds_list_destroy(collision_list);
		ds_list_destroy(clear_list);
		
		//speed = 0;
		instance_destroy(self);
		
		
		
	}
	
	if inst.object_index == objTreasure {
		objPlayer.money += damage;
	}
}