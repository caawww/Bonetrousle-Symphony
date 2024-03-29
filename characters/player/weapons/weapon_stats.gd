class_name WeaponStats
extends Resource

@export_category("DAMAGE")
@export_range(0, 100, 0.1) var damage: float
@export_range(0, 100, 0.1) var area_size: float

@export_category("OTHER")
@export_range(0, 100, 0.1) var cooldown: float
@export_range(0, 10000, 1) var speed: float
@export_range(0, 10000, 1) var range: float
