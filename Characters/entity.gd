class_name Entity
extends CharacterBody2D

@export 
#should there be export?
var health: Stat
@export 
#should there be export?
var speed: Stat

func _init(current_health: int, max_health: int, min_health: int, current_speed: int, max_speed: int, min_speed: int):
	health = Stat.new(current_health, max_health, min_health)
	speed = Stat.new(current_speed, max_speed, min_speed)
	

func take_damage(damage: int):
	var oldhealth: int = health.current_value 
	health.current_value -= damage
	
	if health.current_value != oldhealth:
		#can be used when the entity dies?
		emit_signal("healt_changed", health.current_value) 
		


