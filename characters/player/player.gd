class_name Player
extends Entity

var xp = 0


func _physics_process(_delta):
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")

	velocity = speed.current_value * direction

	#TODO: Animation and Sprite
	#if velocity != Vector2.ZERO:
	#if Input.get_axis("move_left", "move_right") == 1:
	#sprite.set_flip_h(false)
	#elif Input.get_axis("move_left", "move_right") == -1:
	#sprite.set_flip_h(true)
	#
	#sprite.play("walk")

	move_and_slide()


func _on_health_changed(value):
	if value <= 0:
		get_tree().paused = true
		get_parent().get_node("UI/ScoreScreen").visible = true


func add_xp(value: int):
	xp += value
	print(xp)
