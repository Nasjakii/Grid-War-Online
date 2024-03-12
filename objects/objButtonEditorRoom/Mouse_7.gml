





var file_name = working_directory + "Maps/" + objRoomName.string_val + ".ini";

if file_exists(file_name) {
	if !show_question("File Name already exists, override file: " + objRoomName.string_val + "?") exit;
}

if objRoomName.string_val == "" || objRoomSizeEditor.string_val == "" exit;

var size = int64(objRoomSizeEditor.string_val);

scr_save_map(file_name, objRoomName.string_val, size, [], [], [], []);

room_set_width(EditorRoom, size);
room_set_height(EditorRoom, size);

global.map_file_name = file_name; 
global.editor = true;
room_goto(EditorRoom);


