
event_inherited();


if reload_timer <= 0 && objGame.action_step == 1 && image_index != 0 {
	
	reload_timer--;
	if reload_timer == 1 {
		image_index = 0;
	}
	
	var xpos = x + sprite_width / 2;
	var ypos = y + sprite_height / 2;
	var dir = (image_index + 1)* 45;
	instance_create_layer(xpos,ypos, "Instances",objBulletBase, {direction: dir, base_speed : bullet_speed, damage : bullet_damage,player_number : player_number});
	
	
}

