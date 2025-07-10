extends Sprite2D

class_name HeroIcon

func _process(delta: float) -> void:
	var unit = G.battleController.getCurrPlayerUnit()
	if unit && unit.icon != texture:
		texture = unit.icon
		G.battleController.initPlayerUnitIconsSpells()
