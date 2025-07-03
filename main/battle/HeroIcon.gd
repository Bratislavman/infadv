extends Sprite2D

var icon

func _process(delta: float) -> void:
	var unit = G.battleController.getCurrUnit()
	if unit && unit.side == G.battleController.BATTLE_SIDES.HERO && unit.icon != icon:
		texture = unit.icon
