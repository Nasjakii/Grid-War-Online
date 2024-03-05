function scr_initialize_players(){
	var pos = scr_base_pos();
	
	objPlayer.money += scr_get_price(objBase);
	scr_buy(objBase, pos[0], pos[1]);
	
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
				base_x = objGame.field_width - 2;
				base_y = objGame.field_height - 2;
			break;
			case(2):
				base_x = objGame.field_width - 2;
				base_y = 1;
			break;
			case(3):
				base_x = 1;
				base_y = objGame.field_height - 2;
			break;
		}
		
		base_pos[0] = base_x;
		base_pos[1] = base_y;
		
	
	} else {
		var base_x = 0;
		var base_y = 0;
	
		switch(player_num) {
			case(0):
				base_x = floor(objGame.field_width / 3);
				base_y = 1;
			break;
			case(1):
				base_x = floor(objGame.field_width / 3 * 2) - 1;
				base_y = objGame.field_height - 2;
			break;
			case(2):
				base_x = objGame.field_width - 2;
				base_y = floor(objGame.field_height / 3);
			break;
			case(3):
				base_x = 1;
				base_y = floor(objGame.field_height / 3 * 2);
			break;
			case(4):
				base_x = floor(objGame.field_width / 3 * 2) - 1;
				base_y = 1;
			break;
			case(5):
				base_x = floor(objGame.field_height / 3);
				base_y = objGame.field_height - 2;
			break;
			case(6):
				base_x = objGame.field_width - 2;
				base_y = floor(objGame.field_height / 3 * 2);
			break;
			case(7):
				base_x = 1;
				base_y = floor(objGame.field_height / 3);
			break;
		}
		
		base_pos[0] = base_x;
		base_pos[1] = base_y;
	}
	
	return base_pos;
}


function scr_initialize_neutrals() {

		var xpos = floor(field_width / 2);
		var ypos = floor(field_height / 2);
		scr_create(objTreasure, xpos + 1, ypos + 1, 100);
		scr_create(objTreasure, xpos - 1, ypos + 1, 100);
		scr_create(objTreasure, xpos + 1, ypos - 1, 100);
		scr_create(objTreasure, xpos - 1, ypos - 1, 100);
		
		scr_create(objTreasure, xpos, 0, 100);
		scr_create(objTreasure, xpos, 1, 100);
		scr_create(objTreasure, xpos, 2, 100);
		
		scr_create(objTreasure, xpos, field_height - 1, 100);
		scr_create(objTreasure, xpos, field_height - 2, 100);
		scr_create(objTreasure, xpos, field_height - 3, 100);
		
		scr_create(objTreasure, 0, ypos, 100);
		scr_create(objTreasure, 1, ypos, 100);
		scr_create(objTreasure, 2, ypos, 100);
		
		scr_create(objTreasure, field_width - 1, ypos, 100);
		scr_create(objTreasure, field_width - 2, ypos, 100);
		scr_create(objTreasure, field_width - 3, ypos, 100);


	
}

function scr_initialize_tiles() {
	

	//create ground tiles
	for(var i = 0; i < field_width; i++) {
		for(var i2 = 0; i2 < field_height; i2++) {
			scr_change_tile(i,i2,-1);
		}
	}
	


	if global.max_players > 4 {
	
		//top left
		var height = floor(field_width / 3);
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
			for(var i2 = field_width - 1; i2 > field_width - width - 1; i2--) {
				scr_occupy_field(i2,i, 20);
			}
			width--;
		}
	
		//bottom left
		var width = height;
		for(var i = 0; i < height; i++) {
			for(var i2 = field_width - 1; i2 > field_width - width - 1; i2--) {
				scr_occupy_field(i,i2, 20);
			}
			width--;
		}
	
		//bottom right
		var width = height;
		for(var i = field_height - 1; i > field_height - height - 1; i--) {
			for(var i2 = field_width - 1; i2 > field_width - width - 1; i2--) {
				scr_occupy_field(i,i2, 20);
			}
			width--;
		}
	
	}
	
	
}