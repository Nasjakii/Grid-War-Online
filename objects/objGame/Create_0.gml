
if !global.campaign {
	room_width = global.room_size;
	room_height = global.room_size;
} else {
	global.room_size = room_width;
}

last_time = 0;

field_x = 0;
field_y = 0;

field_width = floor(room_width / tile_size);
field_height = floor(room_height / tile_size);


field_grid = ds_grid_create(field_width, field_height);
ds_grid_set_region(field_grid, 0, 0, field_width, field_height, -1);
field_grid_instances = ds_grid_create(field_width, field_height);
field_grid_planned_objects = ds_grid_create(field_width, field_height);
ds_grid_set_region(field_grid_planned_objects, 0, 0, field_width, field_height, -1);
field_grid_planned_by = ds_grid_create(field_width, field_height);
ds_grid_set_region(field_grid_planned_by, 0,0,field_width, field_height,-1);
field_grid_vision = ds_grid_create(field_width, field_height);

scr_initialize_tiles();


game_running = false;
first_start = true;

timer = 0;
timer_counting = 0;

planning = true;
planning_time = global.planning_time;

action = false;
action_time = 1 * game_get_speed(gamespeed_fps);
action_step = 0;

surface_fog = surface_create(room_width,room_height);


player_count = 0;

show_menu = false;
show_stats = false;

gui_message_timer = 0;
gui_message = "";


debugging = false;
draw_grid = false;
disable_fog = false;

instance_create_layer(0,0,layer, objGUI);
instance_create_layer(0,0,layer, objCamera);
instance_create_layer(0,0,layer,objPlayer);








