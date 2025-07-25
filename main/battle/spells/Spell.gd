extends Node

class_name Spell

static var targetTypeList = {
	'enemy': 'enemy',
	'frendly': 'frendly',
	'self': 'self',
}

var target
var icon
var spellName = ''
var caster
var type = ''
var reloadCount = 1
var currentReloadCount = 0
# тип юнита для исп-я спела
var targetType = Spell.targetTypeList.enemy
# теги юнита для исп-я спла() unitTypeList. успех - хоть одно совпадение тега
var targetTags = [Unit.unitTypeList.foot]
# как выше, но успех - все совпадения тегов
var targetTagsStrict = []

func _init(caster):
	self.caster = caster	

func getInfo():
	return ModalInfo.formatText('')

func action(target):
	self.target = target
	preSpellAction()
	postSpellAction()
	
func preSpellAction():
	currentReloadCount = reloadCount

func postSpellAction():
	pass

func reload():
	if (currentReloadCount > 0):
		currentReloadCount -= 1

func checkCanSpellByEffects(target):
	if target && target.effects.size():
		for effect in target.effects:
			if effect is TimeEffectNoneSword && self is SpellAttack:
				return false

	return true

func checkUnitTagsStrict(accum, tag):
	if targetTagsStrict.find(tag) > -1:
		return accum + 1

	return accum

func checkCanSpellByTargetType(target):
	if target:
		if targetTagsStrict.size():
			return target.tags.reduce(checkUnitTagsStrict, 0) == targetTagsStrict.size()

		if targetTags.size():
			for tag in targetTags:
				if target.tags.find(tag) > -1:
					return true
			return false

	return true

func checkCanSpell(target):
	return checkCanSpellByEffects(target) && checkCanSpellByEffects(caster) && checkCanSpellByTargetType(target)
		
func isActive(target = null):
	return currentReloadCount == 0 && checkCanSpell(target)

func remove():
	target = null
	icon = null
	caster = null
	queue_free()

func checkTargetEnemy(target):
	return targetType == Spell.targetTypeList.enemy && caster.unitIsEnemy(target)

func checkTargetFrendly(target):
	return targetType == Spell.targetTypeList.frendly && caster.unitIsFriend(target)

func checkCorrectTarget(target):
	return (checkTargetEnemy(target) || checkTargetFrendly(target)) && isActive(target)
