cam_width = 1920 / 8;
cam_height = 1080 / 8;


window_set_size(1920 / 1.5, 1080 / 1.5);
surface_resize(application_surface, 1920,1080);
display_set_gui_size(1920,1080);



view_enabled = true;
view_visible[0] = true;

start_x = 0;
start_y = 0;
var gap = 0.5;

var base_pos = scr_base_pos();

start_x = base_pos[0] * tile_size - cam_width * gap;
start_y = base_pos[1] * tile_size - cam_height * gap;



view_camera[0] = camera_create_view(start_x,start_y,cam_width, cam_height);



grab_x = 0;
grab_y = 0;
grabbing = false;

scroll_speed = 60;
min_view_width = 100;
max_view_width = room_width * 2.5;

cam_speed = 5;
