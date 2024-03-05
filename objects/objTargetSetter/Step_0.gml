

x = mouse_x;
y = mouse_y;


if right_released || !instance_exists(striker_inst) {
	instance_destroy(self);
}