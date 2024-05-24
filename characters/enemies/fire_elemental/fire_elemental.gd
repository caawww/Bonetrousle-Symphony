extends Enemy


func _physics_process(_delta: float) -> void:
	var direction: Vector2 = (player.global_position - global_position).normalized()
	velocity = speed.current_value * direction
	move_and_slide()

	flip_sprite(direction)
	deal_damage()


func flip_sprite(direction: Vector2):
	if velocity != Vector2.ZERO:
		if direction.x >= 0:
			sprite.set_flip_h(false)

		elif direction.x < 0:
			sprite.set_flip_h(true)

		sprite.play("walk")
