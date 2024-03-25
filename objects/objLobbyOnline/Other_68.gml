var type = async_load[? "type"];

switch(type){
	case(network_type_data):	
		var response = scr_receive_data(false);
		scr_process_data(response);
		
		var cmd_type = ds_map_find_value(response, "type");
		switch(cmd_type) {
			case(CREATE_HOST):
				can_swap = true;
			break;
		}
		
	break;
}
