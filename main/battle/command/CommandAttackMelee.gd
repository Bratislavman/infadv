extends CommandAnim

class_name CommandAttackMelee

func _init(caster: Unit, target: Unit):
	var dmg = func():
		target.dmg(caster.attributes[Attributes.attrNameDmg].value)
		addSpecEffect(preload("res://main/battle/effects/hit/Hit.tscn"))
		
	super._init(caster, target, "attack", dmg)
