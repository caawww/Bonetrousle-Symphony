class_name Player
extends Entity

var xp = 0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(_delta):
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = speed.current_value * direction
	
	move_and_slide()
	flip_sprite(direction)
	
	if velocity == Vector2.ZERO:
		sprite.play("idle")
	

func flip_sprite(direction: Vector2):
	if velocity != Vector2.ZERO:
		if direction.x >= 0:
			sprite.set_flip_h(true)

		elif direction.x < 0:
			sprite.set_flip_h(false)

		sprite.play("walk")


func _on_health_changed(value):
	if value <= 0:
		get_tree().paused = true
		get_parent().get_node("UI/ScoreScreen").visible = true


func add_xp(value: int):
	xp += value
	print(xp)
