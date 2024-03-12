

if fly_up {
	y -= fly_up_speed;
	fly_up_speed *= fly_up_acc;
	
	if y < ystart - flight_height {
		draw = false;
		fly_up = false;
		fly_down = true;
		x = (target_field_x + 0.5) * tile_size ;
		y = (target_field_y + 0.5) * tile_size - flight_height;
	}
}


if fly_down && objGame.action {
	draw = true;
	if y < target_field_y * tile_size {
		image_angle = 180;
		y += fly_down_speed;
	} else {
		//explosion ps
		var part_sys = part_system_create_layer(layer_get_id("Above"), false, psExplodeBig);
		part_system_position(part_sys,x,y);
		//aoe damage
		for(var i = -missile_aoe; i <= missile_aoe; i++) {
			for(var i2 = -missile_aoe; i2 <= missile_aoe; i2++) {
				var field_x = clamp(target_field_x + i, 0, objGrid.field_width - 1);
				var field_y = clamp(target_field_y + i2, 0, objGrid.field_height - 1);
				var inst = scr_get_tower(field_x, field_y);
				
				if inst > 0 && object_is_ancestor(inst.object_index,objTowerParent) {
					inst.hp -= missile_damage;
					scr_update_tower(field_x, field_y,"hp",inst.hp);
				}
			}
		}
		
		instance_destroy(self);
	}
}

