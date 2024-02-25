extends Node2D

class_name Effect

var target = null
var countLife = 0
var events = []

func _init(target, events):
	self.target = target
	self.events = events

func preaction(event):
	return false

func action(event):
	if (preaction(event)):
		if (countLife == 0):
			target.removeEffect(self)
		else:
			countLife -= 1
