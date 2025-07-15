extends CommandAnim

class_name CommandTaming

func _init(caster: Unit, target: Unit):
	var action = func():
		addSpecEffect(preload("res://main/battle/effects/mind/Mind.tscn"))
		TimeEffectTaming.new(target)
		
	super._init(caster, target, "spell", action)
