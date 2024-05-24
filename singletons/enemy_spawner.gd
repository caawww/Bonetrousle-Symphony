class_name EnemySpawner
extends Path2D

@onready var path_follow_2d = $PathFollow2D
@onready var main = $"../.."
@onready var top_left_boundary: Marker2D = $"../../TopLeftBoundary"
@onready var bottom_right_boundary: Marker2D = $"../../BottomRightBoundary"

@export var enemy_scenes: Array[PackedScene]
@export var max_enemies: int = 60
@export var max_wave_size: int = 15

var enemy_counter: int = 0


func set_max_enemies(max_enemies_value: int) -> void:
	max_enemies = max_enemies_value


func get_enemies_ammount() -> int:
	return enemy_counter


func can_spawn_enemy() -> bool:
	return enemy_counter < max_enemies


func set_max_wave_size(max_wave_size_amount: int) -> void:
	max_wave_size = max_wave_size_amount


func min_vector2(v1: Vector2, v2: Vector2) -> Vector2:
	var min_x = min(v1.x, v2.x)
	var min_y = min(v1.y, v2.y)
	return Vector2(min_x, min_y)
	

func max_vector2(v1: Vector2, v2: Vector2) -> Vector2:
	var max_x = max(v1.x, v2.x)
	var max_y = max(v1.y, v2.y)
	return Vector2(max_x, max_y)
	
	
func spawn_wave(wave_size: int) -> void:
	if not can_spawn_enemy():
		return
			
	path_follow_2d.progress_ratio = randf()
	
	for i in range(min(wave_size, max_enemies - enemy_counter)):
		enemy_counter += 1
		var new_enemy = enemy_scenes[randi() % enemy_scenes.size()].instantiate()
		new_enemy.global_position = (
			min_vector2(
				max_vector2(
					path_follow_2d.global_position, top_left_boundary.global_position
				),
				bottom_right_boundary.global_position
			)
			+ Vector2(randf_range(-10, 10), randf_range(-10, 10))
		)
		main.add_child(new_enemy)
		new_enemy.tree_exited.connect(_on_mob_death)


func _on_timer_timeout() -> void:
	spawn_wave(randi() % max_wave_size + 1)


func _on_mob_death() -> void:
	enemy_counter -= 1
