extends Area2D

func _physics_process(delta):
	var enemies = get_overlapping_bodies()
	if enemies.size() > 0:
		look_at(enemies[0].global_position)


func shoot():
	const BULLET = preload("res://characters/player/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootPoint.global_position
	new_bullet.global_rotation = %ShootPoint.global_rotation
	%ShootPoint.add_child(new_bullet)
	

func _on_timer_timeout():
	shoot()
