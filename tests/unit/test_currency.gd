extends GutTest

func test_currency():
	assert_eq(Currency.get_currency(), 0)
	Currency.set_currency(5)
	assert_eq(Currency.get_currency(), 5)
	Currency.add_to_currency(2)
	assert_eq(Currency.get_currency(), 7)
	
func test_currency_save_load():
	assert_eq(
		Currency.save(),
		{
		GameSaver.AUTOLOADS_SYMBOL : true,
		GameSaver.TREE_POSITION_SYMBOL : "/root/Currency",
		"amount" : 0
		}
	)
	
	Currency.load({
		GameSaver.AUTOLOADS_SYMBOL : true,
		GameSaver.TREE_POSITION_SYMBOL : "/root/Currency",
		"amount" : 5
	})
	
	assert_eq(Currency.get_currency(), 5)
	
	assert_eq(
		Currency.save(),
		{
		GameSaver.AUTOLOADS_SYMBOL : true,
		GameSaver.TREE_POSITION_SYMBOL : "/root/Currency",
		"amount" : 5
		}
	)
