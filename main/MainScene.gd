extends Control

func _on_button_pressed():
	G.mainScene = self
	var battleClass = preload("res://main/battle/battles/FirstBattle.gd")
	battleClass.new()
	visible = false
