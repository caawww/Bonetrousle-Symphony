extends Node2D


const SKELETON = preload("res://Characters/Enemy/skeleton.tscn")
var spawn_location := Vector2(-100, - 150)


func _init() -> void:
	for i in range(10):
		var skeleton_instance : Skeleton = SKELETON.instantiate()
		skeleton_instance.global_position = spawn_location
		add_child(skeleton_instance)
		
		spawn_location.x += 40
