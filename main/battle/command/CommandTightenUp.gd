extends CommandAnim

class_name CommandTightenUp

func _init(caster: Unit, target: Unit):
	var action = func():
		TimeEffectTightenUp.new(caster, target)
		
	super._init(caster, target, "spell", action)
