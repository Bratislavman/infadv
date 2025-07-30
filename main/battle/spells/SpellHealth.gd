extends Spell

class_name SpellHealth

func _init(caster):
	icon = preload("res://main/battle/icons/heal.jpg") 
	spellName = 'Лечение' 
	reloadCount = 3
	targetType = Spell.targetTypeList.frendly
	super._init(caster)

func postSpellAction():
	CommandHealth.new(caster, target, 5)

func getInfo():
	var text = '[b]Лечение:[/b] Исцеляет 5 ед. здороавья союзнику.'
	return ModalInfo.formatText(text, true)
