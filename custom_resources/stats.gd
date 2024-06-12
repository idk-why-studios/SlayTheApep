class_name Stats

extends Resource

signal stats_changed

@export var MAX_HEALTH:=1
@export var art : Texture

var health : int : set = set_health


func set_health(value: int)->void:
	health = clampi(value,0,MAX_HEALTH)
	stats_changed.emit()

func take_damage(damage: int)->void:
	if damage <= 0:
		return
	#why clamping damage value?	
	damage = clampi(damage,0,damage)
	self.health = health - damage
	
func heal(value: int)->void:
	if value<=0 :
		return
	value = clampi(value,0,MAX_HEALTH-health)
	self.health = health + value
	
func create_instance() -> Resource:
	var instance: Stats =  self.duplicate()
	instance.health = MAX_HEALTH
	return instance
	
	




