class_name Stat
extends Node


var current_value: float:
	get:
		return current_value
	set(new_value):
		current_value = clamp(new_value, min_value, max_value)

		
var min_value: float:
	get:
		return min_value


var max_value: float:
	get:
		return max_value
	set(new_value):
		max_value = clamp(new_value, min_value, new_value)


func _init(current_val: float, max_val: float, min_val: float) -> void:
	min_value = min_val
	max_value = max_val
	current_value = current_val
