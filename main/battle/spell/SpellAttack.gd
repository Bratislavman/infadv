extends SpellOneTarget

class_name Attack

func action(target):
	super.action(target)
	caster.commandList.append(CommandAttack.new(caster, target, 1))
