extends Spell

class_name AttackDouble

func action(target):
	super.action(target)
	CommandAttack.new(creator, target, 1)
	CommandAttack.new(creator, target, 1)
