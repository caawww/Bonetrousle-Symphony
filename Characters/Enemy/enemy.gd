class_name Enemy
extends Entity

func _init() -> void:
	super._init(100, 100, 0, 100, 100, 0)

func _physics_process(delta: float) -> void:
	var direction := Vector2(10, 10)
	#var direction := Input.get_vector(
		#'move_left', 'move_right', 'move_up', 'move_down'
		#)

	velocity = speed.current_value * direction
	move_and_slide()
	
	# TODO: PLAY ANIMATION	
	#if velocity.length() > 0:
		#%Sprite.play_anim()
	#else:
		#%Sprite.play_anim()
