extends Spell

class_name SpellTaming

func _init(caster):
	icon = preload("res://main/battle/icons/mental.jpg")
	spellName = 'Приручение' 
	reloadCount = 6
	super._init(caster)
	targetTagsStrict = [Unit.unitTypeList.animal]

func postSpellAction():
	CommandTaming.new(caster, target)
