extends CommandAnim
class_name CommandAttackMelee

var hitClass = preload("res://main/battle/effects/hit/Hit.tscn")

func _init(caster: Unit, target: Unit):
	var dmg = func():
		target.dmg(caster.attributes[Attributes.attrNameDmg].value)
		var effect = hitClass.instantiate()

		G.battleField.add_child(effect)
		effect.position = target.position

		effect.init(self)
		effects.append(effect)
		
	super._init(caster, target, "attack", dmg)
