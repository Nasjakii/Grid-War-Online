function scr_ai_tower_place(field_x, field_y, _tower){
	if scr_get_tower(field_x, field_y) == -1 {
		scr_occupy_field(field_x, field_y, player_number);
		return scr_place_tower(player_number, field_x, field_y, _tower);
	}
}