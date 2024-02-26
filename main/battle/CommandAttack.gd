extends CommandCl

class_name CommandAttack

var dmg = 1

func _init(target, dmg):
	super._init(target)
	self.target = target
	self.dmg = dmg

func actionProcess():
	print(target , !target.isDeath, 'target , !target.isDeath')	
	if (target && !target.isDeath):
		G.battleController.pushEvent(
			G.battleController.BATTLE_EVENTS.BEFORE_TAKING_DAMAGE,
		)
	print(processBlock, 'processBlock spell attacj')	
	if (!processBlock):
		target.chrs.HP.minus(dmg)
		isActive = false	
		G.battleController.nextCommand()
	else:
		processBlock = false

