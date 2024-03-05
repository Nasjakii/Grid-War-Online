
sprite_index = level_sprites[level];

var val = 0;

if place_meeting(x,y-tile_size,objWall) val += 1;
if place_meeting(x+tile_size,y,objWall) val += 2;
if place_meeting(x,y+tile_size,objWall) val += 4;
if place_meeting(x-tile_size,y,objWall) val += 8;



image_index = val;

if hp <= 0 {
	scr_destroy(x,y);
}