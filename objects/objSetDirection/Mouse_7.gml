

var x_click = mouse_x - bbox_left;
var y_click = mouse_y - bbox_top;


var x_tile = floor(x_click / (sprite_width / 3));
var y_tile = floor(y_click / (sprite_height / 3));

if x_tile == 1 && y_tile == 1 calling.image_index = 0;
if x_tile == 1 && y_tile == 0 calling.image_index = 1;
if x_tile == 0 && y_tile == 0 calling.image_index = 2;
if x_tile == 0 && y_tile == 1 calling.image_index = 3;
if x_tile == 0 && y_tile == 2 calling.image_index = 4;
if x_tile == 1 && y_tile == 2 calling.image_index = 5;
if x_tile == 2 && y_tile == 2 calling.image_index = 6;
if x_tile == 2 && y_tile == 1 calling.image_index = 7;
if x_tile == 2 && y_tile == 0 calling.image_index = 8;

objEditor.multi_buy_obj = -1;

alarm[0] = 1;

