extends Node

var battleController = null
var battle = null
var mainScene = null

func _ready() -> void:
	var fieldClass = preload("res://main/battle/BattleField.tscn")
	battleController = fieldClass.instantiate()
	battleController.visible = false
	add_child(battleController)

func _process(_delta):
	battleController.action()