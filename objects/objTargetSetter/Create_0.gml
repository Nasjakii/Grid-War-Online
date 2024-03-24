

striker_field_x = call_pos[0];
striker_field_y = call_pos[1];

striker_inst = ds_grid_get(objGrid.field_grid_instances, striker_field_x, striker_field_y);

if !instance_exists(striker_inst) instance_destroy(self);
aoe_size = striker_inst.missile_aoe;


