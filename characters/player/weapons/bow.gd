extends Area2D


const BULLET = preload("res://characters/player/weapons/arrow.tscn")
const AUTO_AIM: bool = false

func _physics_process(delta):
	if AUTO_AIM:
		var enemies = get_overlapping_bodies()
		if enemies.size() > 0:
			look_at(enemies[0].global_position)
			
	else:
		look_at(get_global_mouse_position())


func shoot() -> void:
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootPoint.global_position
	new_bullet.global_rotation = %ShootPoint.global_rotation
	%ShootPoint.add_child(new_bullet)
	

func _on_timer_timeout():
	shoot()
