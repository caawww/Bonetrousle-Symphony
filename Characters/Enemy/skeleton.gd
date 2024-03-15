class_name Skeleton
extends Entity


@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _init() -> void:
	super._init(100, 100, 0, 100, 100, 0)


#func _ready() -> void:
	#sprite.play("walk")


func _physics_process(_delta: float) -> void:
	# TODO: move to player 
	var direction := Input.get_vector(
		'move_left', 'move_right', 'move_up', 'move_down'
		)
		
	# TODO: use speed.current_value instead of 100
	velocity = 100 * direction


	if velocity.length() != 0:
		if Input.get_axis("move_left", "move_right") == 1:
			sprite.set_flip_h(false)
		elif Input.get_axis("move_left", "move_right") == -1:
			sprite.set_flip_h(true)
			
		sprite.play("walk")

	move_and_slide()
