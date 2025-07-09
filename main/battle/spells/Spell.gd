extends Node

class_name Spell

static var targetTypeList = {
	'enemy': 'enemy',
	'frendly': 'frendly',
	'self': 'self',
}

var target
var icon
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

func isReload():
	return currentReloadCount > 0

func remove():
	queue_free()