#macro gui_scale display_get_gui_width() / camera_get_view_width(view_camera[0])
#macro game_speed game_get_speed(gamespeed_fps)

#macro mouse_gui_x device_mouse_x_to_gui(0)
#macro mouse_gui_y device_mouse_y_to_gui(0)

#macro left_released mouse_check_button_released(mb_left)
#macro right_released mouse_check_button_released(mb_right)

#macro gui_width display_get_gui_width()
#macro gui_height display_get_gui_height()

#macro check show_debug_message("check")

#macro tile_size 32

draw_set_font(foDefault);


global.socket = undefined;

global.max_players = 4;

ini_open("Savefile.ini");

global.win_option = ini_read_string("Settings", "win_option", "Bases"); //Bases, Everything
global.bullets_show_always = ini_read_real("Settings", "bullets_show_always", 0);

//game settings

global.network_debugging = false;

global.planning_time = ini_read_real("Settings", "planning_time",2 * game_get_speed(gamespeed_fps));


ini_close();

global.map_file_name = "";

global.room_size = tile_size * 10;

//network
global.host_number = -1;
global.player_number = 0;
global.socket = network_create_socket(network_socket_wss);
network_connect_raw_async(global.socket, "wss://grid-server-gms2.glitch.me/", 443);


