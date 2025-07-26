extends Control

class_name UnitIconSpell

@onready var _icon = $Icon

var spell: Spell = null

func cantPlayerUnitUseSpell():
	var hero = G.battleController.getCurrPlayerUnit()
	return !spell.isActive(G.battleController.unitMouseExited) || hero == null || (hero && (hero.commands.size() > 0 || hero.actionCount == 0))

func init(spell):
	self.spell = spell
	_icon.texture = spell.icon

func _process(delta: float) -> void:
	if G.battleController.isActive:
		if cantPlayerUnitUseSpell():
			modulate = Color(0.234, 0.234, 0.234, 1)
		elif self.spell == G.battleController.currentPlayerSelectSpell: 
			modulate = Color(0.955, 0.957, 0.359, 1)	
		else:
			modulate = Color.WHITE
			
func _input(event):
	# отменяем выбранный спел перса игрока при пкм
	if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_RIGHT:
		G.battleController.playerSelectSpell(null)

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			if !cantPlayerUnitUseSpell():
				G.battleController.playerSelectSpell(spell) 
		if event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
			G.showModalInfo(spell.spellName, spell.getInfo())
