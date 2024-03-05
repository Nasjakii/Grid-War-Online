//reset camera via space
//control camera via arrow-keys
//control camera via window edges

var cam = view_camera[0];
var view_x = camera_get_view_x(cam);
var view_y = camera_get_view_y(cam);

if mouse_check_button_pressed(mb_middle) {
	grab_x = mouse_x;
	grab_y = mouse_y;
	grabbing = true;
}


if grabbing {

	var grab_diff_x = grab_x - mouse_x;
	var grab_diff_y = grab_y - mouse_y;

	var new_x = view_x + grab_diff_x;
	var new_y = view_y + grab_diff_y;

	camera_set_view_pos(cam, new_x, new_y);
}





if mouse_check_button_released(mb_middle) && grabbing {
	grabbing = false;
}

if mouse_wheel_up() {
	var cam = view_camera[0];
	
	var width = camera_get_view_width(cam);
	var height = camera_get_view_height(cam);
	if width - scroll_speed > min_view_width {
		camera_set_view_size(cam, width - scroll_speed, height - scroll_speed * 9/16);
	}
}
if mouse_wheel_down() {
	var cam = view_camera[0];
	
	
	
	var width = camera_get_view_width(cam);
	//scroll_speed = clamp(width - min_view_width, 60, 2000);
	var height = camera_get_view_height(cam);
	if width + scroll_speed < max_view_width {
		camera_set_view_size(cam, width + scroll_speed, height + scroll_speed * 9/16);
	}
}

if !grabbing {
	var cam_hspeed = 0;
	var cam_vspeed = 0;

	if keyboard_check_direct(vk_up) || keyboard_check_direct(ord("W")) {
		cam_vspeed = -cam_speed;
	}
	if keyboard_check_direct(vk_down) || keyboard_check_direct(ord("S")) {
		var cam_vspeed = cam_speed;
	}
	if keyboard_check_direct(vk_left) || keyboard_check_direct(ord("A")) {
		cam_hspeed = -cam_speed;
	}								   
	if keyboard_check_direct(vk_right) || keyboard_check_direct(ord("D")) {
		var cam_hspeed = cam_speed;
	}

	camera_set_view_pos(cam, view_x + cam_hspeed, view_y + cam_vspeed);
}