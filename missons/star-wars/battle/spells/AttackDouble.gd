extends Spell

class_name AttackDouble

func action(target):
	super.action(target)
	print('attack D spel')
	G.battleController.commandList.append(CommandAttack.new(target, 1))
	G.battleController.commandList.append(CommandAttack.new(target, 1))
