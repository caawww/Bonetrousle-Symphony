class_name Xp
extends Node2D

enum XP_LEVELS {NONE=-1, XP1}

const XP_PRELOAD = preload("res://xp/xp.tscn")

var level: XP_LEVELS
@export var xp_sprites: Array[Texture]
@export var xp_vlaues: Array[int]


func set_xp_level(lvl: XP_LEVELS):
	level = lvl
	$Sprite2D.texture = xp_sprites[lvl]


func _on_area_2d_body_entered(body):
	if not body is Player:
		return
		
	var p = body as Player
	p.add_xp(xp_vlaues[level])
