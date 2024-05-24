class_name Entity
extends CharacterBody2D

signal health_changed(value: float)

var health: Stat = null
var speed: Stat = null
var attack_speed: Stat = null
@export var score_per_kill: int = 1
@export var stats: EntityStats


func _ready() -> void:
	health = Stat.new(stats.current_health, stats.max_health, stats.min_health)
	speed = Stat.new(stats.current_speed, stats.max_speed, stats.min_speed)
	attack_speed = Stat.new(
		stats.current_attack_speed,
		stats.max_attack_speed,
		stats.min_attack_speed
	)


func take_damage(damage: float) -> void:
	if self is Enemy:
		%DamageMarker.draw_received_damage(damage)
		
	health.current_value -= damage
	emit_signal("health_changed", health.current_value)
	
