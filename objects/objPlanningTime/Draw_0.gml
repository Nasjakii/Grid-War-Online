
draw_self();

draw_set_font(foDefault);
scr_draw_set(fa_center, fa_bottom, c_white);
draw_text((bbox_right - bbox_left) / 2 + bbox_left, bbox_top - 5, "Planning Time in S");

scr_draw_set(fa_left, fa_middle, c_white);
draw_text(bbox_left + 10, (bbox_bottom - bbox_top) / 2+ bbox_top, string_val);