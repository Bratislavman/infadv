extends Control

class_name DmgSpecEff

var dmg = ''

var counter = 120

@onready var _label = $Label

func init(dmg):
	self.dmg = str(dmg)

func _ready():
	_label.text = dmg

func _process(delta: float) -> void:
	position.y -= 3
	counter-=1
	modulate.a -= 0.01

	if counter <= 0:
		queue_free()
