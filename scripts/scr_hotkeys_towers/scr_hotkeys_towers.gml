
function scr_get_numkey(){
	
	var num = string_digits(keyboard_lastchar);
	if num == "" return - 1;

	if keyboard_check_pressed(ord(num)) {
		num = int64(num)
		return num;
	} 

	return -1;

}