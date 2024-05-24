class_name Enemy
extends Entity


@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: Player = get_node("../Player")


func deal_damage():
	var targets = $Hurtbox.get_overlapping_bodies()
	if targets.size() > 0 and $Timer.get_time_left() == 0:
		for target in targets:
			if target.has_method("take_damage"):
				target.take_damage(1)
				$Timer.start()


func drop_xp(lvl: Xp.XP_LEVELS):
	if lvl == Xp.XP_LEVELS.NONE:
		return
		
	var drop = Xp.XP_PRELOAD.instantiate()
	drop.set_xp_level(lvl)
	drop.global_position = self.global_position
	self.get_parent().call_deferred("add_child", drop)


func _on_health_changed(_value):
	if health.current_value == 0:
		RunStatistics.add_score(score_per_kill)
		drop_xp(Xp.XP_LEVELS.XP1)
		queue_free()
		
	if $AnimationPlayer.is_playing:
		$AnimationPlayer.stop()

	$AnimationPlayer.play("hit_flash")
	
