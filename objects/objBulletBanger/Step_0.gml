
image_angle = direction -90;
image_index = player_number;


if objGame.action {
	
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

		var field_pos = scr_convert_position_coordinates(inst.x,inst.y);
		var hits = scr_grid_get_instances_triangle(field_pos[0], field_pos[1], image_angle, shrapnel_range);

		for(var i = 0; i < array_length(hits); i++) {
			if hits[i] != -1 && instance_exists(hits[i]) {
				hits[i].hp -= damage;
				scr_update_tower(field_pos[0], field_pos[1] - 1,"hp",hits[i].hp);
			}
		}
		
		

		instance_destroy(self);
		
		
		
	}
	
	if inst.object_index == objTreasure {
		objPlayer.money += damage;
	}
}