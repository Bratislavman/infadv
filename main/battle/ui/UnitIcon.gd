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
		if G.battleController.isCurrUnit(unit.get_instance_id()):
			modulate = Color(0.955, 0.957, 0.359, 1)
		else:
			modulate = Color.WHITE
