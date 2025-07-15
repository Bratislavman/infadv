extends CommandAnim

class_name CommandStrongAttack

func _init(caster: Unit, target: Unit):
	var action = func():
		target.dmg(5)
		addSpecEffect(preload("res://main/battle/effects/hit/Hit.tscn"))
		TimeEffectStrongAttackCaster.new(caster, target)
		
	super._init(caster, target, "attack", action)