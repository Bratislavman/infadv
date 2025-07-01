extends Node2D

class_name Attributes

var nameAttr = ''
var valueMax = 0
var value = 0

func _init(name, valueMax):
	nameAttr = name
	self.valueMax = valueMax
	value = valueMax

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
	
