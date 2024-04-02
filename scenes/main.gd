extends Node2D


func _on_timer_run_finished():
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
