extends Marker2D


@export var damage_number : PackedScene
const MAGNITUDE: int = 16


func draw_received_damage(amount: int) -> void:
	var new_damage_number = _get_damage_number(amount)
	
	var tween := get_tree().create_tween()
	var duration: float = 0.75
	var final_value := global_position + _get_direction()
	
	tween.tween_property(
		new_damage_number,
		"position",
		final_value,
		duration
		)

	get_tree().current_scene.add_child(new_damage_number)


func _get_damage_number(amount: int):
	var new_damage_number := damage_number.instantiate()
	new_damage_number.position = global_position
	new_damage_number.get_node("Amount").text = str(amount)
	
	return new_damage_number
	
func _get_direction() -> Vector2:
	return Vector2(randf_range(-1, 1), randf_range(-1, 0)) * MAGNITUDE
	
