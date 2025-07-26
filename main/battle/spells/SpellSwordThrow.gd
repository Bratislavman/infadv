extends Spell

class_name SpellSwordThrow

func _init(caster):
	icon = preload("res://main/battle/icons/throw.jpg")
	spellName = 'Бросок меча' 
	reloadCount = 3
	super._init(caster)
	targetTags = [Unit.unitTypeList.flying, Unit.unitTypeList.foot]

func postSpellAction():
	CommandAttackThrowSword.new(caster, target)

func getInfo():
	var dmgConst = str(caster.attributes[Attributes.attrNameDmg].value)

	var title = '[b]Бросок меча:[/b]'
	var count = ' Перезарядка: {value}'.format({"value": G.pluralizeCountMessage(reloadCount)})
	var text = " Наносит воздушной/наземной цели урон [color=#ED2600] {value} ед.[/color]".format({"value": dmgConst})

	if currentReloadCount > 0:
		title = '[b]Бросок меча(Пер-ка: {value}):[/b] '.format({"value": G.pluralizeCountMessage(currentReloadCount)})

	return ModalInfo.formatText(title + text + count)
