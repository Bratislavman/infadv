extends Spell

class_name SpellStrongAttack

func _init(caster):
	icon = preload("res://main/battle/icons/throw.jpg")
	spellName = 'Могучая атака' 
	reloadCount = 6
	super._init(caster)

func postSpellAction():
	CommandStrongAttack.new(caster, target)