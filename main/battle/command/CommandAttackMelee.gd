extends CommandAnim

class_name CommandAttackMelee

func _init(caster: Unit, target: Unit, dmgValue = 0):
	var dmg = func():
		if dmgValue == 0:
			dmgValue = caster.attributes[Attributes.attrNameDmg].value
		target.dmg(dmgValue)
		addSpecEffect(preload("res://main/battle/effects/hit/Hit.tscn"))
		
	super._init(caster, target, "attack", dmg)
