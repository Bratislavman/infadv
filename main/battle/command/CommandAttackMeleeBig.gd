extends CommandAnim

class_name CommandAttackMeleeBig

func _init(caster: Unit, target: Unit):
	var dmg = func():
		var dmgConst = target.dmg(5)
		addSpecEffect(preload("res://main/battle/effects/hit-big/HitBig.tscn"))
		G.battleController.addSpecEffectDmg(dmgConst, target)
		
	super._init(caster, target, "attack", dmg)
