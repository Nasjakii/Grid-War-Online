
mouse_over = false;
zooming = 0; //val between 0,1

var lay_id = layer_get_id("Backgrounds_1");
background = layer_background_get_id(lay_id);
start_scale = layer_background_get_xscale(background);


box_transition_duration = 0.5 * game_speed;
box_transition_timer = box_transition_duration;


