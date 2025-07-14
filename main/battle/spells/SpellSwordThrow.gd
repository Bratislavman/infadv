extends Spell

class_name SpellSwordThrow

func _init(caster):
	icon = preload("res://main/battle/icons/throw.jpg")
	spellName = 'Бросок меча' 
	reloadCount = 3
	super._init(caster)
	targetTags = [Unit.unitTypeList.flying]

func postSpellAction():
	CommandAttackThrowSword.new(caster, target)