extends Node2D

class_name SpecEffectAnim

static var positionList = {
	'up': 'up',
	'middle': 'middle',
	'down': 'down',
}

var command = null

@onready var _animation_player = $AnimationPlayer

func init(command):
	self.command = command
	if _animation_player:
		_animation_player.play('stay')

func remove():
	var index = command.effects.find(self)
	if index > -1:
		command.effects.remove_at(index)

	command = null

	queue_free()		

func endAnimation():
	remove()
