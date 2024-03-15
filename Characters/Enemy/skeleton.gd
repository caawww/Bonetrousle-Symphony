class_name Skeleton
extends Entity


@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: Player = %Player

func _init() -> void:
	super._init(100, 100, 0, 100, 100, 0)


#func _ready() -> void:
	#sprite.play("walk")


func _physics_process(_delta: float) -> void:
	#var direction := (player.global_position - global_position).normalized()
	var direction := (get_global_mouse_position() - global_position).normalized()
			
	# TODO: use speed.current_value in the equation
	velocity = 50 * direction


	if velocity.length() != 0:
		if Input.get_axis("move_left", "move_right") == 1:
			sprite.set_flip_h(false)
		elif Input.get_axis("move_left", "move_right") == -1:
			sprite.set_flip_h(true)
			
		sprite.play("walk")

	move_and_slide()
