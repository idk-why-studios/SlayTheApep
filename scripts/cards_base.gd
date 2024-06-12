class_name BaseCard extends CardUI

#data from collection.json
@export var value: int
@export var type: String
@export var cost: int
@export var desc: String

#labels on card
@onready var cost_label = $Frontface/CostLabel
@onready var power_label = $Frontface/PowerLabel
@onready var name_label = $Frontface/NameLabel

func _ready():
	super()
	card_data.connect("card_data_updated",_update_display)
	_update_display()
	
func _update_display():
	cost_label.text = "%s" % card_data.cost
	cost_label.text = "%s" % card_data.cost
	name_label.text = "%s" % card_data.nice_name
	if card_data.type == "Attack":
		power_label.text = "%s" % card_data.power
	elif card_data.type == "Block":
		power_label.text = "%s" % card_data.block_amount
	else:
		power_label.visible = false
