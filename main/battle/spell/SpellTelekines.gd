extends SpellOneTarget

class_name Attack

func action(target):
	super.action(target)
	caster.commandList.append(CommandTelekines.new(caster, target, 1))
