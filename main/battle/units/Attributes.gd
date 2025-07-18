extends Node2D

class_name Attributes

static var attrNameDmg = 'dmg'
static var attrNameHp = 'hp'

var nameAttr = ''
var valueMax = 0
var valueDefault = 0
var value = 0

func _init(nameAttr, valueMax, valueDefault = 0):
	nameAttr = nameAttr
	self.valueMax = valueMax
	value = valueMax
	if valueDefault > 0:
		self.valueDefault = valueDefault
	else:
		self.valueDefault = valueMax	

func plus(val):
	var currVal = value + val
	if currVal > valueMax:
		value = valueMax
	else:
		value = currVal		

func minus(val):
	var currVal = value - val
	if currVal < 0:
		value = 0
	else:
		value = currVal	
	
func returnDefaultValue():
	value = valueDefault