

xpos = call_pos[0];
ypos = call_pos[1];
striker_inst = ds_grid_get(objGrid.field_grid_instances, xpos, ypos);

if !instance_exists(striker_inst) instance_destroy(self);
aoe_size = striker_inst.missile_aoe;


