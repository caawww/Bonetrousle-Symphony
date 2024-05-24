class_name Enemy
extends Entity


@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: Player = get_node("../Player")
