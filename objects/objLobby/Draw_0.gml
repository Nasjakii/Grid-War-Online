

scr_draw_set(fa_left, fa_middle, c_black);

for(var i = 0; i < player_count; i++) {
	draw_text(x, y + i * 64, "player_number " + string(i));
}