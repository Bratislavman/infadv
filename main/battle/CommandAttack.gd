extends CommandCl

class_name CommandAttack

var dmg = 1

func _init(creator, target, dmg):
	super._init(creator, target)
	self.target = target
	self.dmg = dmg

func actionProcess():
	if (target && !target.isDeath):
		G.battleController.pushEvent(
			G.battleController.BATTLE_EVENTS.BEFORE_TAKING_DAMAGE,
		)
	if (!isPreprocess):
		Сharacteristic.CHARACTERISTICS.HP.minus(dmg)
		isActive = false	
		G.battleController.nextCommand()

