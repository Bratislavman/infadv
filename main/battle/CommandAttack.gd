extends CommandCast

class_name CommandAttack

func _init(caster, target, dmg):
	var attack = func():
		if (target):
			target.damage(dmg)

	super._init(caster, target, 'attack', attack)

# func actionProcess():
#		G.battleController.pushEvent(
#			G.battleController.BATTLE_EVENTS.BEFORE_TAKING_DAMAGE,
#		)
#	if (!processBlock):
#		target.chrs.HP.minus(dmg)
#		isActive = false
#		G.battleController.nextCommand()
#	else:
#		processBlock = false

