extends Control

class_name UnitIcon

@onready var _icon = $Icon
@onready var _bar = $Bar
@onready var _side = $Side

var unit

func init(unit):
	self.unit = unit
	_icon.texture = unit.icon

func _process(delta: float) -> void:
	if unit != null:
		_bar.value = unit.attributes[Attributes.attrNameHp].value
		_bar.max_value = unit.attributes[Attributes.attrNameHp].valueMax
		
		if G.battleController.isCurrUnit(unit.get_instance_id()):
			modulate = Color(0.955, 0.957, 0.359, 1)
		else:
			modulate = Color.WHITE

		if unit.side ==  G.battleController.BATTLE_SIDES.HERO:
			_side.texture_normal = G.battleController.unitIconSideFriend
		else:
			_side.texture_normal = G.battleController.unitIconSideEnemy

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
			G.showModalInfo(unit.unitName, unit.unitInfo())
