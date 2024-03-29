extends Area2D


var travelled = 0
const STATS: WeaponStats = preload("res://characters/player/weapons/bow.tres")

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	
	var current_speed = STATS.speed
	position += direction * current_speed * delta
	travelled += current_speed * delta
	if travelled > STATS.range:
		queue_free()


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(STATS.damage)
