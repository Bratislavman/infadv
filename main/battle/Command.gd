extends Node

class_name CommandCl

var target = null
static var ids = 0

var id = 0
var isActive = true
var processBlock = false

func _init(target):
	self.target = target
	CommandCl.ids += 1
	id = CommandCl.ids

func actionProcess():
	pass
	
func stop():
	isActive = false
