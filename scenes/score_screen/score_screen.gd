extends Control


func _ready():
	%Score.text = str(RunStatistics.get_score())
	%Reward.text = str(RunStatistics.calculate_rewards())
	%TotalCurrency.text = str(Currency.get_currency())


func _on_restart_button_pressed():
	GameSaver.save_game()
	RunStatistics.reset_score()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_quit_button_pressed():
	GameSaver.save_game()
	get_tree().quit()


func _on_player_health_changed(value: float) -> void:
	if value == 0:
		%SurviveMessage.text = "YOU DIED"
		%Background.color = "ff1e5390"


func _on_run_timer_run_finished():
	%SurviveMessage.text = "VICTORY"
	%Background.color = "00a95690"


func _on_visibility_changed() -> void:
	%Score.text = str(RunStatistics.get_score())
	%Reward.text = str(RunStatistics.calculate_rewards())
	%TotalCurrency.text = str(Currency.get_currency())
