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

func _init(target):
	self.target = target
	target.effects.append(self)

func effectAction():
	countTurns-=1

	if countTurns == 0:
		remove()	

func remove():
	var index = target.effects.find(self)
	if index > -1:
		target.effects.remove_at(index)

	target = null

	queue_free()
