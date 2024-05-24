class_name Skeleton
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


func deal_damage():
	var targets = $Hurtbox.get_overlapping_bodies()
	if targets.size() > 0 and $Timer.get_time_left() == 0:
		for target in targets:
			if target.has_method("take_damage"):
				target.take_damage(1)
				$Timer.start()


func _on_health_changed(_value):
	if health.current_value == 0:
		RunStatistics.add_score(score_per_kill)
		drop_xp(Xp.XP_LEVELS.XP1)
		queue_free()
		
	if $AnimationPlayer.is_playing:
		$AnimationPlayer.stop()

	$AnimationPlayer.play("hit_flash")
