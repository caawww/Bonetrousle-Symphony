extends Control


@onready var health_bar = %HealthBar


func _ready():
	var player: Player = %Player
	
	health_bar.min_value = player.health.min_value
	health_bar.max_value = player.health.max_value
	health_bar.value = player.health.current_value


func _process(_delta):
	pass


func _on_player_health_changed(value: int):
	health_bar.value = value
