
with(objButtonTextParent) {
	if scr_mouse_in_array([bbox_left, bbox_top, bbox_right, bbox_bottom]) {
		objMenu.mouse_over = id;
	} 
	
	if !scr_mouse_in_array([bbox_left, bbox_top, bbox_right, bbox_bottom]) 
		&& objMenu.mouse_over == id 
		|| objMenu.mouse_over == 0 {
		
		objMenu.mouse_over = 0;
	}
}


if mouse_over == 0 zooming -= 0.01 else zooming += 0.01;

zooming = clamp(zooming, 0, 1);
var channel = animcurve_get_channel(zoom_curve, 0);
var val = animcurve_channel_evaluate(channel, zooming) * 0.05;


layer_background_xscale(background, start_scale + val);
layer_background_yscale(background, start_scale + val);



