


if !directory_exists("Maps") directory_create("Maps");



map_names = [];
file_names = [];
map_sizes = [];
var file_name = file_find_first(working_directory + "/Maps/*.ini", fa_none);

while (file_name != "")
{
	ini_open(working_directory + "/Maps/" + file_name);
		array_push(map_names, ini_read_string("Map", "name", "Default Name"));
		array_push(map_sizes, ini_read_string("Map", "size", ""));
		array_push(file_names, file_name);
	ini_close();

    file_name = file_find_next();
}

file_find_close(); 



