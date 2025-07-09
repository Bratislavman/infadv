extends Sprite2D

var icon

func _process(delta: float) -> void:
	var unit = G.battleController.getCurrUnit()
	if unit && unit.isPlayerHero && unit.icon != icon:
		texture = unit.icon