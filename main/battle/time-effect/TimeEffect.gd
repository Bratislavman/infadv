extends Node2D

# класс для бафов и дебафов
class_name TimeEffect

# заканчивает ли применение эффекта ход персонажа
var isEndTurnUnit = false

# баф либо дебаф
var isDebuff = false

var countTurns = 0

var target:Unit = null

var nameEffect = ''
var descriptionEffect = ''

# для родит и дочер связанного спела, дочерний удаляется через родителя что бы не было цикла!
var relatedEffectParent = null
var relatedEffectChild = null

var specEffect = null
var relatedTarget = null

func _init(target):
	self.target = target
	target.effects.append(self)
	G.battleController.add_child(self)

func effectCountTurnsMinus():
	countTurns-=1

	if countTurns == 0:
		remove()	

func effectAction():
	effectCountTurnsMinus()

func getInfo():
	return ModalInfo.formatText('')

func remove():
	if target:
		var index = target.effects.find(self)
		if index > -1:
			target.effects.remove_at(index)
	target = null
	relatedEffectParent = null
	if relatedEffectChild != null:
		relatedEffectChild.remove()
	relatedEffectChild = null
	if specEffect:	
		specEffect.remove()
	specEffect = null
	relatedTarget = null
	queue_free()
