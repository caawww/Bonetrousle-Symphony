class_name Skeleton
extends Entity


@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _init() -> void:
	super._init(100, 100, 0, 100, 100, 0)


func _ready() -> void:
	sprite.play("walk")


func _physics_process(_delta: float) -> void:
	#var direction := Vector2(100, 0)
	var direction := Input.get_vector(
		'move_left', 'move_right', 'move_up', 'move_down'
		)
	print(abs(direction.angle()))
	#print(speed.current_value)
	velocity = 100 * direction
	move_and_slide()
	
	# TODO: PLAY ANIMATION
	if velocity.length() != 0:
		if abs(direction.angle()) < PI / 2:
			sprite.set_flip_h(false)
		else:
			sprite.set_flip_h(true)
			
		sprite.play("walk")
