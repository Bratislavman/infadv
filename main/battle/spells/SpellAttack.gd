extends Spell

class_name SpellAttack

func _init(caster):
	icon = preload("res://main/battle/icons/attack.jpg")
	spellName = 'Атака' 
	super._init(caster)

func postSpellAction():
	CommandAttackMelee.new(caster, target)
