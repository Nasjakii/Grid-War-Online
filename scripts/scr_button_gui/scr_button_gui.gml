//put in gui function

function scr_button_gui(sprite, xpos, ypos, scale){
	
	var spr = sprNextButton;
	var width = sprite_get_width(spr);
	var height = sprite_get_height(spr);
	
	
	var hovered = point_in_rectangle(mouse_gui_x, mouse_gui_y, 
									xpos - width / 2, ypos - height / 2, 
									xpos + width / 2, ypos + height / 2)
	
	draw_sprite_ext(sprNextButton, hovered, xpos, ypos, scale, scale, 0, c_white, 1);
	
	
	
	return hovered && left_released;
}