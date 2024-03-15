///@description length is for the length of the both diagonals
function scr_grid_get_instances_triangle(field_x, field_y, dir, length){
	var inst_arr = [];
	
	var x_dir = sign(lengthdir_x(length, dir));
	var y_dir = sign(lengthdir_y(length, dir));
	if dir < 0 dir += 360;

	scr_debug("xdir, ydir, dir, field_x, field_y, length",x_dir, y_dir, dir, field_x, field_y, length);
	
	if dir mod 90 == 0 {
		for(var i = 0; i <= length; i++) {
			var inst = ds_grid_get(objGrid.field_grid_instances, field_x + i * x_dir, field_y + i * y_dir);
			array_push(inst_arr, inst);
			for(var i2 = -i; i2 <= i; i2++) {
				var inst = ds_grid_get(objGrid.field_grid_instances, field_x + i * x_dir + y_dir * i2, field_y + i * y_dir + x_dir * i2);
				array_push(inst_arr, inst);
			}
		}
	} else { //square
		for(var i = 0; i <= length; i++) {
			for(var i2 = 0; i2 <= length; i2++) {
				var inst = ds_grid_get(objGrid.field_grid_instances, field_x + i * x_dir, field_y + i2 * y_dir);
				array_push(inst_arr, inst);
			}
		}
	}
	
	
	
	inst_arr = array_unique(inst_arr);
	show_debug_message(inst_arr);
	return inst_arr;
}