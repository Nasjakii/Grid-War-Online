draw_self();



if drag draw_set_color(c_black) else draw_set_color(c_white);
draw_circle(circle_x,y,circ_size, false);

draw_set_font(foDefaultSmall);
scr_draw_set(fa_center, fa_middle, c_white);
value = 1/(x_max-x_min) * (circle_x-x_min);
draw_text(circle_x, y - sprite_height * 2, value);

if point_in_circle(mouse_x, mouse_y, circle_x, y, circ_size) && mouse_check_button_pressed(mb_left) {
	drag = true;
}

if left_released drag = false;

if drag {
	circle_x = clamp(mouse_x, x_min, x_max);
}

