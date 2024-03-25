
var type = async_load[? "type"];

switch(type){
	case(network_type_data):	

		var response = scr_receive_data(false);
		host_list = scr_process_data(response);

	break;
}


