extends CommandAnim

class_name CommandAttackThrowSword

func _init(caster: Unit, target: Unit):
	var action = func():
		target.dmg(caster.attributes[Attributes.attrNameDmg].value)
		addSpecEffect(preload("res://main/battle/effects/ligth-throw/LigthThrow.tscn"))
		TimeEffectNoneSword.new(caster)
		
	super._init(caster, target, "attack", action)
