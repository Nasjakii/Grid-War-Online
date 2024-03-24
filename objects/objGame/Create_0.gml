
//timer
game_running = false;
first_start = true;
timer = 0;
timer_counting = 0;
planning = true;
action = false;
action_time = 1 * game_get_speed(gamespeed_fps);
action_step = 0;


player_count = 0;

if room_get_name(room) == "Room1" {
	show_bullets = objPersistent.show_bullets_room1;
	planning_time = objPersistent.planning_time_room1;
} else {
	show_bullets = objPersistent.show_bullets_campaign;
	planning_time = objPersistent.planning_time_campaing;
}




//belongs to gui tbh
show_menu = true;
show_stats = false;
gui_message_timer = 0;
gui_message = "";
debugging = false;

instance_create_layer(0,0,layer, objTowers);
instance_create_layer(0,0,layer, objGrid);
instance_create_layer(0,0,layer, objGUI);
instance_create_layer(0,0,layer, objCamera);
instance_create_layer(0,0,layer, objPlayer);

if objPersistent.win_option_room1 == "Testing" {
	objPlayer.money = 4000000;
}








