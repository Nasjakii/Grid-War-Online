

if !global.is_host || !clickable exit;



if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) && left_released {
	
	with(objUIParent) {
		clickable = false;
	} 
	
	objLobby.show_bullets = !objLobby.show_bullets;
	objLobby.values_changed = true;
	image_index++;
}

