


if game_state == "lost" || game_state == "won" exit;

draw_set_font(foDefault);
scr_draw_set(fa_right, fa_top, c_white);
var str = string(floor(money));
var offset = 10;

draw_sprite_ext(sprUIPlayerStats, 0, gui_width - 200 - offset * 1.5, 3, 1,1, 0, c_white, 1);

if floor(objGame.timer) == objGame.planning_time-1 gold_per_turn = 0;
draw_text(display_get_gui_width() - offset, offset, str);
draw_text(display_get_gui_width() - offset, offset + 45, string(gold_per_turn));

if level == undefined level = 0;
draw_text(display_get_gui_width() - offset, offset + 85, string(level));

