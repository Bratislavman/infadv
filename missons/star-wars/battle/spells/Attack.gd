extends Spell

class_name Attack

func action(target):
	super.action(target)
	print(' attack spel')
	G.battleController.commandList.append(CommandAttack.new(target, 1))
