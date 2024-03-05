sprite_index = level_sprites[level];

if hp <= 0 {
	scr_destroy(x,y);
}


if objGame.action_step == 1 {
	
	reload_timer--;
	if reload_timer == 1 {
		image_index = 0;
	}
	if reload_timer <= 0 && target_field_x != -1 {
		reload_timer = reload_time;
		instance_create_layer(x + sprite_width / 2,y,"Above", objStrikerMissile, 
				{image_index : level, 
				 missile_aoe : missile_aoe, 
				 missile_damage : missile_damage, 
				 target_field_x : target_field_x,
				 target_field_y : target_field_y
				 });
		image_index = 1;
	}
}
