class_name Player
extends Entity


func _init() -> void:
	super._init(
		100,    # current_health
		100,    # max_health
		0,      # min_health
		100,    # current_speed
		100,    # max_speed
		0       # min_speed
	)
	
	
func _physics_process(_delta):
	var direction := Input.get_vector(
		'move_left', 'move_right', 'move_up', 'move_down'
	)

	# TODO: use speed.current_value in the equation	
	velocity = 100 * direction
	
	#TODO: Animation and Sprite
	#if velocity != Vector2.ZERO:
		#if Input.get_axis("move_left", "move_right") == 1:
			#sprite.set_flip_h(false)
		#elif Input.get_axis("move_left", "move_right") == -1:
			#sprite.set_flip_h(true)
			#
		#sprite.play("walk")

	move_and_slide()
