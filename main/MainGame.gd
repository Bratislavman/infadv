extends Node

var battleController = null
var modalInfo = null
var battle = null
var mainScene = null

func _ready() -> void:
	var fieldClass = preload("res://main/battle/BattleField.tscn")
	battleController = fieldClass.instantiate()
	battleController.visible = false
	add_child(battleController)


	var modalInfoClass = preload("res://main/battle/modals/info/ModalInfo.tscn")
	modalInfo = modalInfoClass.instantiate()
	modalInfo.visible = false
	add_child(modalInfo)

func _process(_delta):
	battleController.action()
