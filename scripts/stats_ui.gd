class_name Stats_UI
extends HBoxContainer


@onready var health: HBoxContainer =  $Health
@onready var HLabel: Label =  $Health/HLabel

func update_stats(stats : Stats)->void:
	HLabel.text = str(stats.health)
	

