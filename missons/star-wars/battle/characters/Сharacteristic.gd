extends Node

class_name Сharacteristic

static var CHARACTERISTICS = {
	'HP': 'HP',
	'DMG': 'DMG',
}

var title = ""
var value = 0

func _init(name, value):
	self.title = name
	self.value = value

func minus(val):
	var newVal = value - val
	if newVal <= 0:
		value = 1
	else:
		value = newVal
