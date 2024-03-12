
if instance_exists(objSetDirection) exit;

var inst = instance_create_depth(x,y, -999, objSetDirection);
inst.calling = id;
inst.image_index = image_index;


