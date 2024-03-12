
global.max_players = 4; //elsewise grid will be other format
var grid = instance_create_depth(0,0,0,objGrid);
grid.disable_fog = true;

var re_arr = scr_start_room(global.map_file_name);
map_name = re_arr[0];
map_size = re_arr[1];


instance_create_depth(0,0,0,objTowers);


ds_grid_set_region(objGrid.field_grid_vision, 0,0,objGrid.field_width, objGrid.field_height,1);

hover_set = false;
multi_buy_obj = -1;
multi_select = false;
multi_select_objects = ds_list_create();

overlay_type = "";


selected_player = 0;
selected_level = 0;

show_menu = false;


instance_create_layer(100,100, layer,  objDropDownPlayerSelect);
instance_create_layer(gui_width - sprite_get_width(object_get_sprite(objDropDownSetLevel)) - 100,100, layer,  objDropDownSetLevel);

auto_save_time = 5 * game_speed
alarm[0] = auto_save_time;

