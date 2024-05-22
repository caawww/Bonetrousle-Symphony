extends Node

var currency: int


func _ready():
	add_to_group(GameSaver.SAVE_GROUP)


func set_currency(amount: int):
	currency = amount


func get_currency():
	return currency


func add_to_currency(amount: int):
	currency += amount


func save():
	var save_dict = {
		GameSaver.AUTOLOADS_SYMBOL: true,
		GameSaver.TREE_POSITION_SYMBOL: get_path(),
		"amount": currency
	}
	return save_dict


func load(save_dict: Dictionary):
	currency = save_dict.get("amount")
	
	
func reset():
	set_currency(0)
