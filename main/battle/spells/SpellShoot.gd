extends Spell

class_name SpellShoot

func _init(caster):
	icon = preload("res://main/battle/icons/blaster.jpg")
	spellName = 'Выстрел' 
	reloadCount = 3
	super._init(caster)
	targetTags = [Unit.unitTypeList.flying]

func postSpellAction():
	CommandAttackShoot.new(caster, target)
