extends CommandCast

class_name CommandTelekines

func _init(caster, target, dmg):
	var spell = func():
		if (target):
			target.damage(dmg)

	super._init(caster, target, 'spell', spell)
