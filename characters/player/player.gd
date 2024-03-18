class_name Player
extends Entity


func _init() -> void:
	super._init(100, 100, 0, 100, 100, 0)
	
	
func _physics_process(_delta):
	#var direction := Input.get_vector(
	#'move_left', 'move_right', 'move_up', 'move_down'
	#)
	
	#velocity = speed.current_value * direction
	
	#if velocity != Vector2.ZERO:
		#if Input.get_axis("move_left", "move_right") == 1:
			#sprite.set_flip_h(false)
		#elif Input.get_axis("move_left", "move_right") == -1:
			#sprite.set_flip_h(true)
			#
		#sprite.play("walk")
#
	#move_and_slide()
	
	pass
