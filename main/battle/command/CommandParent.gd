extends Node

class_name CommandParent

static var ids = 0

var id = 0
var caster = null
# для сложных команд с несколькими фазами
var phase = 0

func _init():
	CommandParent.ids += 1
	id = CommandParent.ids

# код. исполняемый в process юнита
func action():
	if caster:
		if caster.isLive():
			actionEffect()
		else:
			caster.removeCommand(id)

# что делает команда во время исполнения
func actionEffect():
	pass