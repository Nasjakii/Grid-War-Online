
if host_list == undefined exit;

if ds_list_size(host_list) > 0 {
	var from = 0;
	var count = 10;
	
	for (var i = 0; i < ds_list_size(host_list) && i < from + count; ++i) {
		var host = ds_list_find_value(host_list, i);
		
		var x1 = 200;
		var x2 = 1300;
		var y1 = (i + 1) * 64;
		var y2 = (i + 2) * 64 - 30;
		
		var hov_color = c_white;
		if point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2) {
			hov_color = c_black;
			
			if left_released {
				objJoin.local_host_number = i;
				objJoin.local_player_number = ds_list_size(host);
				objJoin.join = true;
			}
		}
		draw_set_color(hov_color);
		draw_rectangle(x1, y1, x2, y2, true);
		draw_rectangle(x1 - 1, y1 - 1, x2 + 1, y2 + 1, true);
		draw_rectangle(x1 - 2, y1 - 2, x2 + 2, y2 + 2, true);
		draw_rectangle(x1 - 3, y1 - 3, x2 + 3, y2 + 3, true);
		
		scr_draw_set(fa_left, fa_middle, c_black);
	    draw_text(x1, y1, " Lobbynumber: " + string(i));
		draw_set_halign(fa_right);
	    draw_text(x2, y1, "Playercount: " + string(ds_list_size(host)) + " ");
		
	}
	
	if ds_list_size(host_list) > 10 {
		draw_set_halign(fa_left);
		draw_text(20,20,"Notify developer, he didnt expect this many lobbies");
	}
}


