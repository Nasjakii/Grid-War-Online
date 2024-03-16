
overlay_gui_hovered = false;

overlay_type = "";
overlay_x = 0;
overlay_y = 0;


clicked_field[0] = 0;
clicked_field[1] = 0;

multi_buy_obj = -1;

multi_select_objects = ds_list_create();
multi_select = false;

hover_set = false;
hover_message_box_array = [-1, -1, -1, -1];
hover_message_str = "";
hover_message_text_color = c_black;
hover_message_font = foDefaultBig;
hover_message_offset = 20;

hover_message_tag = false;
hover_message_tag_text = "";

hover_message_body_active = false;
hover_message_body_text_color = c_black;
hover_message_body_font = foDefault;
hover_message_body_str = "";

destroy_timer = 0;
destroy_duration = 1 * game_speed;


