
event_inherited();


var val = 0;

if place_meeting(x,y-tile_size,objWallEditor) && instance_place(x,y-tile_size, objWallEditor).player_number == player_number val += 1;
if place_meeting(x+tile_size,y,objWallEditor) && instance_place(x+tile_size,y, objWallEditor).player_number == player_number val += 2;
if place_meeting(x,y+tile_size,objWallEditor) && instance_place(x,y+tile_size, objWallEditor).player_number == player_number val += 4;
if place_meeting(x-tile_size,y,objWallEditor) && instance_place(x-tile_size,y, objWallEditor).player_number == player_number val += 8;



image_index = val;







