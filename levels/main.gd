extends Node2D

#const EnemySpawner = preload("res://characters/enemies/enemy_spawner.gd")


#func _init() -> void:
	#for i in range(10):
		#var skeleton_instance : Skeleton = SKELETON.instantiate()
		#skeleton_instance.global_position = spawn_location
		#add_child(skeleton_instance)
		#
		#spawn_location.x += 40
		

func spawn_single_mob()-> void:
	#more mobs-possibilyty for randomness
	var new_mob = preload("res://characters/enemies/skeleton.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func spawn_wave(wave_size)-> void:
	%PathFollow2D.progress_ratio = randf()
	for i in range(wave_size):
		var new_mob = preload("res://characters/enemies/skeleton.tscn").instantiate()
		new_mob.global_position = %PathFollow2D.global_position + Vector2(randf_range(-0.1, 0.1), randf_range(-0.1, 0.1))
		add_child(new_mob)
	
func _on_timer_timeout():
	spawn_wave(int(randf_range(1, 16)))
