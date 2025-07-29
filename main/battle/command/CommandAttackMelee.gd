extends CommandAnim

class_name CommandAttackMelee

func _init(caster: Unit, target: Unit, dmgValue = 0):
	var dmgConst = caster.attributes[Attributes.attrNameDmg].value

	var dmg = func():
		if dmgValue == 0:
			dmgValue = dmgConst
		dmgConst = target.dmg(dmgValue)
		addSpecEffect(preload("res://main/battle/effects/hit/Hit.tscn"))
		G.battleController.addSpecEffectDmg(dmgConst, target)
		
	super._init(caster, target, "attack", dmg)
