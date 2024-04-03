extends Control

@onready var health_bar = %HealthBar
@onready var run_timer = %RunTimer


func _ready():
	var player: Player = %Player

	health_bar.min_value = player.health.min_value
	health_bar.max_value = player.health.max_value
	health_bar.value = player.health.current_value


func _process(_delta):
	_update_elapsed_time()


func _update_elapsed_time() -> void:
	var minutes_elapsed: int = run_timer.time_elapsed / 60
	var seconds_elapsed: int = run_timer.time_elapsed % 60
	%RunTimerLabel.text = "%02d:%02d" % [minutes_elapsed, seconds_elapsed]


func _on_player_health_changed(value: int):
	health_bar.value = value
