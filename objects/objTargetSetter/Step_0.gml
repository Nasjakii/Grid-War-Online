

x = mouse_x;
y = mouse_y;


if keyboard_check_released(ord("Q")) || !instance_exists(striker_inst) {
	instance_destroy(self);
}