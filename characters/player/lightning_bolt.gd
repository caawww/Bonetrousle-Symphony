extends Area2D


# TODO: weapon stat
const DAMAGE: int = 100
const WAIT_TIME: int = 5

func _physics_process(delta):
	_change_wait_time()


func _on_timer_timeout():
	var enemies = get_overlapping_bodies()
	var number_of_enemies: int = enemies.size()
	
	if number_of_enemies > 0:
		var random_enemy_index: int = randi() % number_of_enemies
		
		var body = enemies[random_enemy_index]
		if body.has_method("take_damage"):
			body.take_damage(DAMAGE)


func _change_wait_time():
	$Timer.wait_time = WAIT_TIME
