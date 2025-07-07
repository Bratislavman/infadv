extends Spell

class_name SpellDoubleAttack

func _init(caster):
	icon = preload("res://main/battle/icons/attack.jpg") 
	reloadCount = 3
	super._init(caster)

func postSpellAction():
	CommandAttackMelee.new(caster, target)
	CommandAttackMelee.new(caster, target)
