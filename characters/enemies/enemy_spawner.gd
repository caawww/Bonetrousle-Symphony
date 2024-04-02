class_name Enemy_Spawner
extends Path2D

@onready var path_follow_2d = $PathFollow2D
@onready var mob_scene = preload("res://characters/enemies/skeleton.tscn")
var max_enemies = 60 #predefined
var enemy_counter = 0
var max_wave_size = 15
@onready var main = $"../.."


func set_max_enemies(max_enemies_value: int) -> void:
	max_enemies = max_enemies_value


func get_enemies_ammount() -> int:
	return enemy_counter
	
	
func can_spawn_enemy() -> bool:
	return enemy_counter < max_enemies
	
	
func set_max_wave_size(max_wave_size_ammount) -> void:
	max_wave_size = max_wave_size_ammount


func spawn_wave(wave_size: int) -> void:
	path_follow_2d.progress_ratio = randf()
	for i in range(wave_size):
		if not can_spawn_enemy():
			return
			
		enemy_counter += 1
		var new_mob = mob_scene.instantiate()
		new_mob.global_position = path_follow_2d.global_position + Vector2(randf_range(-10, 10), randf_range(-10, 10))
		main.add_child(new_mob)
		new_mob.tree_exited.connect(_on_mob_death)


func _on_timer_timeout() -> void:
	spawn_wave(randi() % max_wave_size + 1)


func _on_mob_death() -> void:
	enemy_counter -= 1
