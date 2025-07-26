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
	var dmgConst = caster.attributes[Attributes.attrNameDmg].value
	var count = ModalInfo.formatText('Перезарядка: ' + G.pluralizeCountMessage(reloadCount))
	var text = ModalInfo.formatText('Наносит воздушной/наземной цели урон [color=#ED2600]' + str(dmgConst) + ' ед.[/color] ')
	var title = '[b]' + '[b]Бросок меча:' + '[/b]'
	if currentReloadCount > 0:
		title = '[b]' + 'Бросок меча' + '(Пер.:' + G.pluralizeCountMessage(currentReloadCount) + '):' +  '[/b]'
	return title + text	+ count
