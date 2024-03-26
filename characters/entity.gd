class_name Entity
extends CharacterBody2D


var health: Stat
var speed: Stat


func _init(
		current_health: int,
		max_health: int,
		min_health: int,
		current_speed: int,
		max_speed: int,
		min_speed: int
		) -> void:
	
	health = Stat.new(current_health, max_health, min_health)
	speed = Stat.new(current_speed, max_speed, min_speed)
	

func set_stat() -> void:
	pass
	
	
func take_damage(damage: int) -> void:
	var oldhealth: int = health.current_value 
	health.current_value -= damage
	
	if health.current_value != oldhealth:
		emit_signal("healt_changed", health.current_value)
	
	if health.current_value == 0:
		queue_free()
