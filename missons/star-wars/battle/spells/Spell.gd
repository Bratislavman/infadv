extends Node

class_name Spell

var type = ''
var reloadCount = 1
var currentReloadCount = 0
	
func preSpellAction():
	currentReloadCount = reloadCount

func reload():
	if (currentReloadCount > 0):
		currentReloadCount -= 1
		
func isActive():
	return currentReloadCount == 0
