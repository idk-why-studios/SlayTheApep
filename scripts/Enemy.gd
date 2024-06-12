class_name Enemy
extends Area2D

@export var stats:Player_stats : set = set_Enemy_stats

@onready var sprite_2d : Sprite2D = $Sprite2D
@onready var stats_ui : Stats_UI = $Stats_UI  as Stats_UI

func set_Enemy_stats(value:Player_stats)->void:
	stats = value.create_instance() 
	
	if not stats.stats_changed.is_connected(update_stats):
		stats.stats_changed.connect(update_stats)
	
	update_Enemy()

func update_Enemy()->void:
	if not stats is Player_stats:
		return
	if not is_inside_tree():
		await ready
	
	sprite_2d.texture = stats.art
	update_stats()
	hp()
	
func update_stats()->void:
	stats_ui.update_stats(stats)

func take_damage(damage:int)->void:
	if stats.health<=0:
		return
	
	stats.take_damage(damage)
	
	if stats.health<=0:
		queue_free()

func hp()->void:
	var hpbar = $ProgressBar
	var hpperc = (stats.health/stats.MAX_HEALTH)*100
	hpbar.value = hpperc
