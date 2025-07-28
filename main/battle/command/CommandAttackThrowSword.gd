extends CommandAnim

class_name CommandAttackThrowSword

func _init(caster: Unit, target: Unit):
	var action = func():
		var dmgConst = caster.attributes[Attributes.attrNameDmg].value
		target.dmg(dmgConst)
		addSpecEffect(preload("res://main/battle/effects/ligth-throw/LigthThrow.tscn"))
		TimeEffectNoneSword.new(caster)
		G.battleController.addSpecEffectDmg(dmgConst, target)
		
	super._init(caster, target, "attack", action)
