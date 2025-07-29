extends CommandAnim

class_name CommandAttackShoot

func _init(caster: Unit, target: Unit):
	var action = func():
		var dmgConst = target.dmg(3)
		addSpecEffect(preload("res://main/battle/effects/hit/Hit.tscn"))
		G.battleController.addSpecEffectDmg(dmgConst, target)
		
	super._init(caster, target, "shoot", action)
