extends Control

@onready var _icon = $Icon
@onready var _bar = $Bar

var unit

func init(unit):
	self.unit = unit
	_icon.texture_normal = unit.icon

func _process(delta: float) -> void:
	if unit:
		_bar.value = unit.attributes[Attributes.attrNameHp].value
		_bar.max_value = unit.attributes[Attributes.attrNameHp].valueMax
