extends Node2D

class_name SpecEffectAnim

var command = null

func _init(command):
	self.command = command

func endAnimation():
	queue_free();