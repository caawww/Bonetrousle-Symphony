extends Control



func _ready():
	%Score.text = str(RunStatistics.get_score())
	%Reward.text = str(RunStatistics.calculate_rewards())
	%TotalCurrency.text = str(Currency.get_currency())


func _on_restart_button_pressed():
	RunStatistics.reset_score()
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
