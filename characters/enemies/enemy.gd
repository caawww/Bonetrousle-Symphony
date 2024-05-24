class_name Enemy
extends Entity


@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: Player = get_node("../Player")


func drop_xp(lvl: Xp.XP_LEVELS):
	if lvl == Xp.XP_LEVELS.NONE:
		return
		
	var drop = Xp.XP_PRELOAD.instantiate()
	drop.set_xp_level(lvl)
	drop.global_position = self.global_position
	self.get_parent().call_deferred("add_child", drop)
