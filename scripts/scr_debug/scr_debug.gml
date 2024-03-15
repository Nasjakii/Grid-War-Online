
function scr_debug(str){
	for (var i = 1; i < argument_count; ++i) {
	    // code here
		str += string(i) + ": " + string(argument[i]) + " ";
	}
	
	show_debug_message(str);
}