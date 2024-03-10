
event_inherited();

if objGame.action_step == 1 && image_index != 0 {
	
	var xpos = x + sprite_width / 2;
	var ypos = y + sprite_height / 2;
	var dir = (image_index + 1)* 45;
	instance_create_layer(xpos,ypos, "Instances", objBulletBanger, 
		{direction: dir, 
		 base_speed : bullet_speed,
		 damage : bullet_damage,
		 player_number : player_number,
		 shrapnel_damage : shrapnel_damage
		 });
	
	
}