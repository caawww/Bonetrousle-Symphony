class_name Xp
extends Node2D

enum XP_LEVEL {NONE, XP1}

const XP_SPRITES = {XP1 = "res://sprites/xp/xp1.png"}
const XP_VALUES = {XP1 = 1}

var level: XP_LEVEL


func _ready():
	$Sprite2D.texture = XP_SPRITES.get(level)


func set_xp_level(lvl: XP_LEVEL):
	level = lvl


func _on_area_2d_body_entered(body):
	pass # Replace with function body.
