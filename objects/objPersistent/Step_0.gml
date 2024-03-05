

if keyboard_check_released(vk_f8) {
	global.network_debugging = !global.network_debugging;
}

if keyboard_check_released(vk_f11) {
	window_set_fullscreen(!window_get_fullscreen());
}


