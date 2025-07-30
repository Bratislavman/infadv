extends Spell

class_name SpellShoot

func _init(caster):
	icon = preload("res://main/battle/icons/blaster.jpg")
	spellName = 'Выстрел' 
	reloadCount = 3
	super._init(caster)
	targetTags = [Unit.unitTypeList.flying, Unit.unitTypeList.foot]

func postSpellAction():
	CommandAttackShoot.new(caster, target)

func getInfo():
	var text = '[b]Выстрел:[/b] Наносит 3 ед. урона летающему и пешему противнику.'
	return ModalInfo.formatText(text, true)