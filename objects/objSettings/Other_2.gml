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

#region Networking

	#macro CREATE_HOST 0
	#macro STOP_HOST 1
	#macro GET_HOSTS 2
	#macro JOIN_LOBBY 3
	#macro GAMESETTINGS 4
	#macro START_GAME 5
	#macro RUNNING 6
	#macro OCCUPY_FIELD 7
	#macro CREATE_TOWER 8
	#macro UPDATE_TOWER 9
	#macro DESTROY_TOWER 10
	#macro DISCONNECT_CLIENT 11

#endregion

draw_set_font(foDefault);


global.socket = undefined;

global.max_players = 4;

global.network_debugging = false;


global.room_size = tile_size * 10;


//network
global.lobby_number = -1;
global.is_host = false;
global.player_number = 0;
global.socket = network_create_socket(network_socket_wss);
network_connect_raw_async(global.socket, "wss://grid-server-gms2.glitch.me/", 443);

global.online = false;
global.connected = false;