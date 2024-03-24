

if !directory_exists(working_directory + "Maps") directory_create(working_directory + "Maps");



map_names = [];
file_names = [];
map_sizes = [];
var path = working_directory + "Maps/";
var file_name = file_find_first(path + "*.ini", fa_none);

while (file_name != "") {
	ini_open("Maps/" + file_name);
		show_debug_message(ini_read_string("Map", "name", "Error"));
		array_push(map_names, ini_read_string("Map", "name", "Error"));
		array_push(map_sizes, ini_read_real("Map", "size", 0));
		array_push(file_names, file_name);
	ini_close();

    file_name = file_find_next();
}

file_find_close(); 



