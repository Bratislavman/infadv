extends Spell

class_name SpellTightenUp

func _init(caster):
	icon = preload("res://main/battle/icons/pull.jpg")
	spellName = 'Притянуть'
	targetType = Spell.targetTypeList.frendly
	targetTags = [Unit.unitTypeList.flying, Unit.unitTypeList.foot]
	super._init(caster)

func getInfo():
	return ModalInfo.formatText('[b]Притянуть:[/b]  Позволяет спасти себия или союзника от одной атаки в течении 3 ходов.', true)

func postSpellAction():
	CommandTightenUp.new(caster, target)
