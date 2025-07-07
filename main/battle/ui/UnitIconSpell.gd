extends Control

@onready var _icon = $Icon

var spell: Spell = null

func isSpellCurrentUser():
	return G.battleController.isCurrUnit(spell.caster.get_instance_id())

func init(spell):
	self.spell = spell
	_icon.texture_normal = spell.icon

func _process(delta: float) -> void:
	if spell != null:
		if spell.isReload() || !isSpellCurrentUser():
			modulate = Color(0.234, 0.234, 0.234, 1)
		else:
			modulate = Color.WHITE

func _on_icon_button_down() -> void:
	if spell && isSpellCurrentUser():
		G.battleController.playerSelectSpell(spell) 

func _input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_RIGHT:
		G.battleController.playerSelectSpell(null)
