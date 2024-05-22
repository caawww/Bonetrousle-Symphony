extends Control


func _ready():
	GameSaver.load_game()
	$MarginContainer2/HBoxContainer/Currency.text = str(Currency.get_currency())


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://scenes/options_menu/options_menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
