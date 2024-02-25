extends Spell

class_name Attack

func action(target):
	super.action(target)
	CommandAttack.new(creator, target, 1)
