draw_self();

draw_set_font(foDefault);
scr_draw_set(fa_center, fa_bottom, c_white);
draw_text((bbox_right - bbox_left) / 2 + bbox_left, bbox_top, text);
