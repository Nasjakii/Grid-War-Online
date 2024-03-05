

money = 10;
objGame.player_count++;
player_number = 1; 

base_pos = scr_base_pos(player_number);

scr_occupy_field(base_pos[0], base_pos[1], player_number);
scr_place_tower(player_number, base_pos[0], base_pos[1], objBase);

action_speed = 5 * game_speed;

alarm[0] = action_speed;

action = 0;

