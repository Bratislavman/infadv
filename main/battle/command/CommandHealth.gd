extends CommandAnim

class_name CommandHealth

func _init(caster: Unit, target: Unit, hp):
	var effect = func():
		target.health(hp)
		addSpecEffect(preload("res://main/battle/effects/holy/Holy.tscn"), SpecEffectAnim.positionList.down)
		
	super._init(caster, target, "spell", effect)
