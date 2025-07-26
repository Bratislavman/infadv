extends TimeEffect

class_name TimeEffectTaming

func getInfo():
	return ModalInfo.formatText('')	

func _init(target):
	countTurns = 3
	target.side = G.battleController.BATTLE_SIDES.HERO
	super._init(target)

func remove():
	target.side = G.battleController.BATTLE_SIDES.ENEMY
	super.remove()