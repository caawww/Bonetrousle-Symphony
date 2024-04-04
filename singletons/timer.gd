class_name RunTimer
extends Timer

signal run_finished
var time_elapsed: int = 0
@export var game_lenght: int = 10 * 60


func _on_timeout():
	time_elapsed += 1
	if time_left() <= 0:
		_on_run_finished()


func _on_run_finished():
	emit_signal("run_finished")
	get_tree().paused = true
	%ScoreScreen.visible = true


func time_left() -> int:
	return game_lenght - time_elapsed
