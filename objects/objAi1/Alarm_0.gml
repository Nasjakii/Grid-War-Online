
alarm[0] = action_speed;

if !objGame.game_running exit;

switch(action) {
	case(0):
		scr_ai_tower_place(base_pos[0] - 1, base_pos[1] - 1, objCollector);
	break;
	case(1):
		scr_ai_tower_place(base_pos[0] - 2, base_pos[1] - 2, objCollector);
	break;
	case(2):
		var inst = scr_ai_tower_place(base_pos[0] - 1, base_pos[1] - 3, objCannon);
		//show_debug_message(inst);
		if inst != -1 {
			inst.image_index = 2;
		}
		
	break;
	case(3):
		var inst = scr_ai_tower_place(base_pos[0] - 3, base_pos[1] - 1, objCannon);
		if inst != -1 {
			inst.image_index = 2;
		}
	break;
}



action++;