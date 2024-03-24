
var name_str = objRoomName.string_val;


if name_str == "" || objRoomSizeEditor.string_val == "" {
	//show message
	exit;
}

var file_path = "Maps/" + objRoomName.string_val + ".ini"; 


if file_exists(file_path) {
	if !show_question("File Name already exists, override file: " + objRoomName.string_val + "?") exit;
}




objPersistent.map_file_editor = file_path; 

var size = int64(objRoomSizeEditor.string_val);

scr_save_map(file_path, objRoomName.string_val, size);

room_set_width(EditorRoom, size);
room_set_height(EditorRoom, size);


global.online = false;
room_goto(EditorRoom);


