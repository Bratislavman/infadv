extends CommandAnim
class_name CommandAttackMelee

var hitClass = preload("res://main/battle/effects/hit/Hit.tscn")

func _init(caster: Unit, target: Unit):
	var dmg = func():
		target.dmg(caster.attributes[Attributes.attrNameDmg].value)
		
		var effect = hitClass.instantiate()

		G.battleController.add_child(effect)
		effect.position = target.position
		effect.position.y -= target._mouse_hendler_area.size.y/2

		effect.init(self)

		effects.append(effect)
		
	super._init(caster, target, "attack", dmg)
