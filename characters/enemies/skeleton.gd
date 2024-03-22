class_name Skeleton
extends Entity


@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: Player = get_node("../Player")
#@onready var player: Player = get_node("%Player")


func _init() -> void:
	super._init(100, 100, 0, 50, 50, 0)


func _physics_process(_delta: float) -> void:
	var direction := (player.global_position - global_position).normalized()
	#var direction := (get_global_mouse_position() - global_position).normalized()
	
	# TODO: use speed.current_value in the equation
	velocity = speed.current_value * direction

	if velocity != Vector2.ZERO:
		if direction.x >= 0:
			sprite.set_flip_h(false)
		elif direction.x < 0:
			sprite.set_flip_h(true)
			
		sprite.play("walk")

	move_and_slide()
