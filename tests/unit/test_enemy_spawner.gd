extends GutTest


func test_spawn_counter():
	var enemy_spawner := EnemySpawner.new()
	assert_eq(enemy_spawner.enemy_counter, 0)
	assert_true(enemy_spawner.can_spawn_enemy())

#func test_spawn_waves():
##var main := preload("res://scenes/main.tscn").instantiate()
##var spawner: EnemySpawner = main.get_node("Player/EnemySpawner")
##spawner.spawn_wave(100)
