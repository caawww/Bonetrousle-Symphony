extends Area2D

const ARROW := preload("res://characters/player/weapons/arrow.tscn")
const AUTO_AIM: bool = false
const STATS: WeaponStats = preload("res://characters/player/weapons/bow.tres")


func _physics_process(_delta):
	$Timer.wait_time = STATS.cooldown

	if AUTO_AIM:
		var enemies = get_overlapping_bodies()
		if enemies.size() > 0:
			look_at(enemies[0].global_position)

	else:
		look_at(get_global_mouse_position())


func shoot() -> void:
	var new_arrow = ARROW.instantiate()
	new_arrow.global_position = %ShootPoint.global_position
	new_arrow.global_rotation = %ShootPoint.global_rotation
	%ShootPoint.add_child(new_arrow)


func _on_timer_timeout():
	shoot()
