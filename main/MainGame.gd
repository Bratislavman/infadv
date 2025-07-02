extends Node

var mission = null
var battleController = BattleController.new()
var battle = null
var mainScene = null

func _process(_delta):
	battleController.action()
