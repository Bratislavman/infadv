extends CommandParent

class_name CommandEndTurn

func commandStart():
	phase = 1
	caster.endTurn()
