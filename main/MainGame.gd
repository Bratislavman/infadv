extends Node

var battleController = null
var battle = null
var battleField = null
var mainScene = null

func _ready() -> void:
	G.battleController = BattleController.new()

	var fieldClass = preload("res://main/battle/Field.tscn")
	battleField = fieldClass.instantiate()
	battleField.visible = false
	add_child(battleField)

func _process(_delta):
	battleController.action()
