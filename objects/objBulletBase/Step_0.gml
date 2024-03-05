
image_angle = direction -90;
image_index = player_number;

if objGame.action {
	speed = base_speed;
} else {
	speed = 0;
}

//speed just not to get the error message of out of grid size
if x <= speed || x >= objGame.field_width * tile_size - speed || y <= speed || y >= objGame.field_height * tile_size - speed  {
	instance_destroy(self);
}

if place_meeting(x,y,objTowerParent) {
	var inst = instance_place(x,y,objTowerParent);

	if inst.player_number != player_number {
		var part_sys = part_system_create_layer(layer_get_id("Above"), false, psExplode);
		part_system_position(part_sys,x,y);
		
		//damage
		inst.hp -= damage;
		var field_pos = scr_convert_position_coordinates(inst.x,inst.y);
		scr_update_tower(field_pos[0], field_pos[1],"hp",inst.hp);
		
		instance_destroy(self);
	}
	
	if inst.object_index == objTreasure && global.player_number == player_number {
		objPlayer.money += damage * 2;
	}
}