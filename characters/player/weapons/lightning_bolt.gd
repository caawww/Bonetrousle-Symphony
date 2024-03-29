extends Area2D


const STATS: WeaponStats = preload("res://characters/player/weapons/lightning_bolt.tres")

func _physics_process(delta):
	$Timer.wait_time = STATS.cooldown


func _on_timer_timeout():
	var enemies := get_overlapping_bodies()
	var number_of_enemies: int = enemies.size()
	
	if number_of_enemies > 0:
		var random_enemy_index: int = randi() % number_of_enemies
		
		var body = enemies[random_enemy_index]
		if body.has_method("take_damage"):
			body.take_damage(STATS.damage)
