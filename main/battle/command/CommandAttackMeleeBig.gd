extends CommandAnim

class_name CommandAttackMeleeBig

func _init(caster: Unit, target: Unit):
	var dmg = func():
		target.dmg(5)
		addSpecEffect(preload("res://main/battle/effects/hit-big/HitBig.tscn"))
		
	super._init(caster, target, "attack", dmg)
