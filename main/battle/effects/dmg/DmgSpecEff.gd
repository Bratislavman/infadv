extends Control

class_name DmgSpecEff

var counter = 120

@onready var _label = $Label

func init(dmg):
	_label.text = str(dmg)

func _process(delta: float) -> void:
	position.y -= 3
	counter-=1
	modulate.a -= 0.01

	if counter <= 0:
		queue_free()
