extends Node

class_name CommandParent

static var ids = 0

var id = 0

func _init():
	CommandParent.ids += 1
	id = CommandParent.ids
