extends Node

var battleController = null
var modalInfo = null
var modalMenu = null
var battle = null
var mainScene = null

func _ready() -> void:
	var fieldClass = preload("res://main/battle/BattleField.tscn")
	battleController = fieldClass.instantiate()
	battleController.visible = false
	add_child(battleController)

	var modalMenuClass = preload("res://main/battle/modals/menu/ModalMenu.tscn")
	modalMenu = modalMenuClass.instantiate()
	modalMenu.visible = false
	add_child(modalMenu)

	var modalInfoClass = preload("res://main/battle/modals/info/ModalInfo.tscn")
	modalInfo = modalInfoClass.instantiate()
	modalInfo.visible = false
	add_child(modalInfo)

func _process(_delta):
	battleController.action()

func showModalInfo(title, text):
	modalInfo.init(title, text)
	modalInfo.visible = true

func closeModalInfo():
	modalInfo.visible = false

func pluralizeCountMessage(value, withBrackets = false):
	var pluraleWordIndex = 0

	var pluraleValue = abs(value) % 10

	if pluraleValue >= 5:
		pluraleWordIndex = 2
	elif pluraleValue >= 2 && pluraleValue <= 4:
		pluraleWordIndex = 1

	var text = str(value) + ' ' + tr_n("COUNTS[" + str(pluraleWordIndex) + "]", "", value)

	if withBrackets:
		return '(' + text + ')'

	return text	
