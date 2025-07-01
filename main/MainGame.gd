extends Node

var mission = null
var battleController = BattleController.new()
var battleField = null

func _process(_delta):
	battleController.action()
