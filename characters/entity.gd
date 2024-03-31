class_name Entity
extends CharacterBody2D


signal health_changed(value: int)

var stats: EntityStats = null
var health: Stat = null
var speed: Stat = null

func _init(entity_type: String):
	var entity_stats := load("res://characters/resources/%s.tres" % entity_type) as EntityStats
	health = Stat.new(entity_stats.current_health, entity_stats.max_health, entity_stats.min_health)
	speed = Stat.new(entity_stats.current_speed, entity_stats.max_speed, entity_stats.min_speed)


func take_damage(damage: int) -> void:
	var oldhealth: int = health.current_value 
	health.current_value -= damage
	
	if health.current_value != oldhealth:
		emit_signal("health_changed", health.current_value)
	
	if not self is Player and health.current_value == 0:
		queue_free()
