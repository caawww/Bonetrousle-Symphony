extends GutTest

var TEST_FILE = "user://testsave.save"

func test_save():
	var rnd = RandomNumberGenerator.new()
	var num = rnd.randi_range(0, 50)
	Currency.set_currency(num)
	
	GameSaver.save_game_to_file(TEST_FILE)
	
	assert_true(FileAccess.file_exists(TEST_FILE))
	
	var game_save = FileAccess.open(TEST_FILE, FileAccess.READ)
	var json_string = game_save.get_line()
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	
	assert_true(parse_result == OK)

	var node_data = json.get_data()
	
	assert_eq(node_data[GameSaver.AUTOLOADS_SYMBOL], true)
	assert_eq(node_data[GameSaver.TREE_POSITION_SYMBOL], "/root/Currency")
	assert_eq(node_data["amount"], num)

func test_load():
	Currency.set_currency(100)
	assert_eq(Currency.get_currency(), 100)
	
	GameSaver.save_game_to_file(TEST_FILE)
	
	Currency.set_currency(0)
	assert_eq(Currency.get_currency(), 0)
	
	GameSaver.load_game_from_file(TEST_FILE)
	assert_eq(Currency.get_currency(), 100)
