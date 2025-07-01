extends Node2D

class_name Effect

var target = null
var countLife = 0
var events = []

func _init(target, events):
	self.target = target
	self.events = events

func effectAction(event):
	return false
	
func ends():
	if (countLife == 0):
		target.removeEffect(self)
	else:
		countLife -= 1

func action(event):
	effectAction(event)
