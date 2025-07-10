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
var targetType = Spell.targetTypeList.enemy

func _init(caster):
	self.caster = caster	

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
		
func isActive():
	return currentReloadCount == 0

func remove():
	queue_free()

func checkTargetEnemy(target):
	return targetType == Spell.targetTypeList.enemy && caster.unitIsEnemy(target)

func checkTargetFrendly(target):
	return targetType == Spell.targetTypeList.frendly && caster.unitIsFriend(target)

func checkCorrectTarget(target):
	return checkTargetEnemy(target) || checkTargetFrendly(target) 