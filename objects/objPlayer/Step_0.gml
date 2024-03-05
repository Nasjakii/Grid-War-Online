

if game_state == "lost" || game_state == "won" || !instance_exists(objGame) exit;

for(var i = 0; i <= global.max_players; i++) {
	player_alive[i] = false;
}

#region Bases and level
	//how many bases you have build
	if instance_exists(objBase) {
		with(objBase) {
			if player_number == global.player_number {
				ds_list_add(objPlayer.level_list, level);
			}
		}

		ds_list_sort(level_list, false);  //check for max level
		level = ds_list_find_value(level_list, 0);
	
	}
	//how many bases you have planned
	if instance_exists(objPlanner) {
		with(objPlayer){
			if sprite_index == sprBase {
				ds_list_add(objPlayer.level_list, 0);
			}
		}
	}
#endregion

#region player state
if objGame.action_step >= objGame.action_time - 1 {
	
	switch(global.win_option) {
		case("Bases"):
			with(objBase) {
				objPlayer.player_alive[player_number] = true;
			}
		break;
		case("Everything"):
			with(objTowerParent) {
				objPlayer.player_alive[player_number] = true;
			}
			
		break;
		case("Testing"):
		
			for(var i = 0; i <= global.max_players; i++) {
				player_alive[i] = true;
			}
			
		break;
	}
	
	if !player_alive[global.player_number] {
		game_state = "lost";
	}
	
	var players_alive = 0;
	for(var i = 0; i < array_length(player_alive); i++) {
		if player_alive[i] players_alive++; 
	}
	if players_alive == 1 && game_state != "lost" game_state = "won";
	
}

#endregion

ds_list_clear(level_list);