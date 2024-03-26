class_name EnemySpawner
extends Node

var spawn_timer: Timer

#func _ready() -> void:
	## Initialize the timer
	#spawn_timer = Timer.new()
	#spawn_timer.wait_time = 1 # Spawn every 1 second
	#spawn_timer.autostart = true
	#spawn_timer.connect("timeout", Callable(self, "_on_spawn_timer_timeout"))
	#add_child(spawn_timer)
#
#func _on_spawn_timer_timeout() -> void:
	## Spawn 10 enemies
	#for i in range(10):
		#spawn_enemy()
#
#func spawn_enemy() -> void:
	## Directly instance the Skeleton class
	#var enemy_instance = Skeleton.new()  # Assumes Skeleton class is properly defined and accessible
	#enemy_instance.position = Vector2(randf_range(0, 1024), randf_range(0, 768))  # Example position
	#add_child(enemy_instance)
	#
