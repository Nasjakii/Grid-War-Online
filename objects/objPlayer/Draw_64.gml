


if game_state == "lost" || game_state == "won" exit;

draw_set_font(foDefault);
scr_draw_set(fa_right, fa_top, c_white);
var str = "money: " + string(floor(money));
var offset = 10;
draw_sprite_stretched(sprHUDStats, 0, gui_width - 200 - offset * 2, 0, gui_width, 100);
draw_text(display_get_gui_width() - offset, offset, str);
draw_text(display_get_gui_width() - offset, offset + 30, "mpt: " + string(gold_per_turn));
if floor(objGame.timer) == objGame.planning_time-1 gold_per_turn = 0;

if level == undefined level = 0;
draw_text(display_get_gui_width() - offset, offset + 60, "level: " + string(level));

