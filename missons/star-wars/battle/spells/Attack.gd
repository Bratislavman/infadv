extends Spell

class_name Attack

func action(target):
	super.action(target)
	G.battleController.commandList.append(CommandAttack.new(target, 1))
