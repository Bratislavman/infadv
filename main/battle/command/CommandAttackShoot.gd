extends CommandAnim

class_name CommandAttackShoot

func _init(caster: Unit, target: Unit):
	var action = func():
		target.dmg(3)
		addSpecEffect(preload("res://main/battle/effects/hit/Hit.tscn"))
		
	super._init(caster, target, "shoot", action)
