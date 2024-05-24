extends Node

const SAVE_GROUP = "SavedData"

const AUTOLOADS_SYMBOL = "singleton"
const TREE_POSITION_SYMBOL = "path"
const FILE_NAME_SYMBOL = "filename"
const PARENT_TREE_POSITION_SYMBOL = "parent"

const DEFAULT_SAVE_FILE = "user://savegame.save"


func save_game():
	save_game_to_file(DEFAULT_SAVE_FILE)


func save_game_to_file(file_name: String):
	var game_save = FileAccess.open(file_name, FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group(SAVE_GROUP)

	for node in save_nodes:
		if !node.has_method("save"):
			continue

		var node_data = node.call("save")
		var json_string = JSON.stringify(node_data)
		game_save.store_line(json_string)


func load_game():
	load_game_from_file(DEFAULT_SAVE_FILE)


func load_game_from_file(file_name: String):
	if not FileAccess.file_exists(file_name):
		return

	var game_save = FileAccess.open(file_name, FileAccess.READ)

	while game_save.get_position() < game_save.get_length():
		var json_string = game_save.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)

		if not parse_result == OK:
			continue

		var node_data = json.get_data()
		var node = get_node_for_load(node_data)

		if !node.has_method("load"):
			continue

		node.call("load", node_data)


func get_node_for_load(node_data: Dictionary):
	if node_data[AUTOLOADS_SYMBOL]:
		return get_node(node_data[TREE_POSITION_SYMBOL])
	var node = load(node_data[FILE_NAME_SYMBOL]).instantiate()
	get_node(node_data[PARENT_TREE_POSITION_SYMBOL]).add_child(node)
	return node


func reset_save():
	reset_nodes()
	DirAccess.remove_absolute(DEFAULT_SAVE_FILE)
	
	
func reset_nodes():
	if not FileAccess.file_exists(DEFAULT_SAVE_FILE):
		return

	var game_save = FileAccess.open(DEFAULT_SAVE_FILE, FileAccess.READ)

	while game_save.get_position() < game_save.get_length():
		var json_string = game_save.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)

		if not parse_result == OK:
			continue

		var node_data = json.get_data()
		var node = get_node_for_load(node_data)

		if !node.has_method("reset"):
			continue

		node.call("reset")
