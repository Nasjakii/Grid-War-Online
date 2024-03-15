function scr_initialize_players(player_num = global.player_number){
	var pos = scr_base_pos();
	
	scr_occupy_field(pos[0], pos[1], player_num);
	scr_tower_create(objBase, pos[0], pos[1], player_num);
	
}

function scr_base_pos(player_num = global.player_number) {
	
	var base_pos = [];
	
	if global.max_players <= 4 {
	
		var base_x = 0;
		var base_y = 0;
	
		switch(player_num) {
			case(0):
				base_x = 1;
				base_y = 1;
			break;
			case(1):
				base_x = objGrid.field_width - 2;
				base_y = objGrid.field_height - 2;
			break;
			case(2):
				base_x = objGrid.field_width - 2;
				base_y = 1;
			break;
			case(3):
				base_x = 1;
				base_y = objGrid.field_height - 2;
			break;
		}
		
		base_pos[0] = base_x;
		base_pos[1] = base_y;
		
	
	} else {
		var base_x = 0;
		var base_y = 0;
	
		switch(player_num) {
			case(0):
				base_x = floor(objGrid.field_width / 3);
				base_y = 1;
			break;
			case(1):
				base_x = floor(objGrid.field_width / 3 * 2) - 1;
				base_y = objGrid.field_height - 2;
			break;
			case(2):
				base_x = objGrid.field_width - 2;
				base_y = floor(objGrid.field_height / 3);
			break;
			case(3):
				base_x = 1;
				base_y = floor(objGrid.field_height / 3 * 2);
			break;
			case(4):
				base_x = floor(objGrid.field_width / 3 * 2) - 1;
				base_y = 1;
			break;
			case(5):
				base_x = floor(objGrid.field_height / 3);
				base_y = objGrid.field_height - 2;
			break;
			case(6):
				base_x = objGrid.field_width - 2;
				base_y = floor(objGrid.field_height / 3 * 2);
			break;
			case(7):
				base_x = 1;
				base_y = floor(objGrid.field_height / 3);
			break;
		}
		
		base_pos[0] = base_x;
		base_pos[1] = base_y;
	}
	
	return base_pos;
}


function scr_initialize_neutrals() {

		var xpos = floor(objGrid.field_width / 2);
		var ypos = floor(objGrid.field_height / 2);
		scr_tower_create(objTreasure, xpos + 1, ypos + 1, 100);
		scr_tower_create(objTreasure, xpos - 1, ypos + 1, 100);
		scr_tower_create(objTreasure, xpos + 1, ypos - 1, 100);
		scr_tower_create(objTreasure, xpos - 1, ypos - 1, 100);
		
		scr_tower_create(objTreasure, xpos, 0, 100);
		scr_tower_create(objTreasure, xpos, 1, 100);
		scr_tower_create(objTreasure, xpos, 2, 100);
		
		scr_tower_create(objTreasure, xpos, objGrid.field_height - 1, 100);
		scr_tower_create(objTreasure, xpos, objGrid.field_height - 2, 100);
		scr_tower_create(objTreasure, xpos, objGrid.field_height - 3, 100);
		
		scr_tower_create(objTreasure, 0, ypos, 100);
		scr_tower_create(objTreasure, 1, ypos, 100);
		scr_tower_create(objTreasure, 2, ypos, 100);
		
		scr_tower_create(objTreasure, objGrid.field_width - 1, ypos, 100);
		scr_tower_create(objTreasure, objGrid.field_width - 2, ypos, 100);
		scr_tower_create(objTreasure, objGrid.field_width - 3, ypos, 100);


	
}

function scr_initialize_tiles() {
	

	//create ground tiles
	for(var i = 0; i < objGrid.field_width; i++) {
		for(var i2 = 0; i2 < objGrid.field_height; i2++) {
			scr_change_tile(i,i2,-1);
		}
	}
	


	if global.max_players > 4 {
	
		//top left
		var height = floor(objGrid.field_width / 3);
		var width = height;
		for(var i = 0; i < height; i++) {
			for(var i2 = 0; i2 < width; i2++) {
				scr_occupy_field(i2,i, 20);
			}
			width--;
		}
	
		//top right
		var width = height;
		for(var i = 0; i < height; i++) {
			for(var i2 = objGrid.field_width - 1; i2 > objGrid.field_width - width - 1; i2--) {
				scr_occupy_field(i2,i, 20);
			}
			width--;
		}
	
		//bottom left
		var width = height;
		for(var i = 0; i < height; i++) {
			for(var i2 = objGrid.field_width - 1; i2 > objGrid.field_width - width - 1; i2--) {
				scr_occupy_field(i,i2, 20);
			}
			width--;
		}
	
		//bottom right
		var width = height;
		for(var i = objGrid.field_height - 1; i > objGrid.field_height - height - 1; i--) {
			for(var i2 = objGrid.field_width - 1; i2 > objGrid.field_width - width - 1; i2--) {
				scr_occupy_field(i,i2, 20);
			}
			width--;
		}
	
	}
	
	
}