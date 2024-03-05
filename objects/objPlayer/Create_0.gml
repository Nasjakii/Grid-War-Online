money = 9;
gold_per_turn = 0;

show_debug_message(global.win_option);
if global.win_option == "Testing" {
	money = 4000000;
} else window_set_fullscreen(true);


level = 0;

level_list = ds_list_create();


game_state = "";


