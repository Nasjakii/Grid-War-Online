

field_width = floor(room_width / tile_size);
field_height = floor(room_height / tile_size);


field_grid = ds_grid_create(field_width, field_height);
ds_grid_set_region(field_grid, 0, 0, field_width, field_height, -1);
field_grid_instances = ds_grid_create(field_width, field_height);
field_grid_planned_objects = ds_grid_create(field_width, field_height);
ds_grid_set_region(field_grid_planned_objects, 0, 0, field_width, field_height, -1);
field_grid_planned_by = ds_grid_create(field_width, field_height);
ds_grid_set_region(field_grid_planned_by, 0,0,field_width, field_height,-1);
field_grid_vision = ds_grid_create(field_width, field_height);

scr_initialize_tiles();


draw_grid = false;

surface_fog = surface_create(room_width,room_height);
disable_fog = false;
