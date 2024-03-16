var spr = sprUITimerBar;
var cell_count = planning_time / game_speed * 3;
var planning_timer = cell_count * round(min(timer / planning_time, 1) * cell_count) / cell_count;

draw_sprite_ext(spr, 0, 0,0, cell_count,1, 0, c_white, 1);
draw_sprite_ext(spr, 1, 0,0, planning_timer,1, 0, c_white, 1);

var action_timer_xoffset = sprite_get_width(spr) * cell_count;
cell_count = action_time / game_speed * 3;
var action_timer = cell_count * round(clamp((timer - planning_time) / action_time, 0, 1) * cell_count) / cell_count;

draw_sprite_ext(spr, 2, action_timer_xoffset, 0, cell_count, 1, 0, c_white, 1);
draw_sprite_ext(spr, 3, action_timer_xoffset + action_timer,0, action_timer,1, 0, c_white, 1);
