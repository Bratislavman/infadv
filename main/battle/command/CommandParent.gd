extends Node

class_name CommandParent

var phase = 0
var caster = null
var target = null
var effects: Array = []

func _init(caster: Unit, target: Unit = null):
	caster.commands.push_back(self) 
	self.caster = caster
	self.target = target
	G.battleController.add_child(self)

func remove():
	var index = caster.commands.find(self)
	if index > -1:
		caster.commands.remove_at(index)

	if effects.size():
		for effect in effects:
			effect.remove()

	caster = null
	target = null
	effects = []

	queue_free()

func commandStart():
	pass

func commandProcess():
	return false

func _process(delta: float) -> void:
	if phase == 0 && caster.checkCurrentCommand(self):
		commandStart()

	if phase == 1:
		if commandProcess():
			return

		if effects.size() == 0:
			remove()
