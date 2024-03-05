
sprite_index = level_sprites[level];

if objGame.action == true {
	image_speed = 1;
} else {
	image_index = 0;
	image_speed = 0;
}

if hp <= 0 {
	scr_destroy(x,y);
}


