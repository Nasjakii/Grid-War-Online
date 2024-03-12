
game_running = false;
first_start = true;

timer = 0;
timer_counting = 0;

planning = true;
planning_time = global.planning_time;

action = false;
action_time = 1 * game_get_speed(gamespeed_fps);
action_step = 0;




player_count = 0;

show_menu = false;
show_stats = false;

gui_message_timer = 0;
gui_message = "";


debugging = false;


instance_create_layer(0,0,layer, objGrid);
instance_create_layer(0,0,layer, objGUI);
instance_create_layer(0,0,layer, objCamera);
instance_create_layer(0,0,layer, objPlayer);








