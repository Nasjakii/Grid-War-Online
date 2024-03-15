if keyboard_check_pressed(vk_escape) && overlay_type != "" {
	overlay_type = ""; //close overlay
}

scr_debug("overlay_type: ", overlay_type);