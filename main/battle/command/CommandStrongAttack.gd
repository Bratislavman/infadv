extends CommandAnim

class_name CommandStrongAttack

func _init(caster: Unit, target: Unit):
	var action = func():
		TimeEffectStrongAttackCaster.new(caster, target)
		
	super._init(caster, target, "attack", action)