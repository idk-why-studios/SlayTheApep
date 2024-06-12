class_name Player_stats

extends Stats

@export var MAX_MP:=1

var MP : int : set = set_MP


func set_MP(value: int)->void:
	MP = clampi(value,0,MAX_MP)
	stats_changed.emit()

func reset_mana()->void:
	self.MP = MAX_MP

func create_instance() -> Resource:
	var instance: Player_stats =  self.duplicate()
	instance.health = MAX_HEALTH
	instance.reset_mana()
	return instance
