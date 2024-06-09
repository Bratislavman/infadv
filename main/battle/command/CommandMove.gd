extends CommandParent

class_name CommandMove

func _init(unit):
	super._init()
	unit.playAnim('move')
	