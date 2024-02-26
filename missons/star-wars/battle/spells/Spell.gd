extends Node

class_name Spell

var creator = null
var target = null
var reloadCount = 1
var currentReloadCount = 0

func _init(creator):
	self.creator = creator

func action(target):
	currentReloadCount = reloadCount
	self.target = target

func reload():
	if (currentReloadCount > 0):
		currentReloadCount -= 1
		
func isActive():
	return currentReloadCount == 0
