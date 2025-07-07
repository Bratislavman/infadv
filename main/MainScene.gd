extends Control

func _ready() -> void:
	G.mainScene = self

func _on_button_pressed():
	var battleClass = preload("res://main/battle/battles/FirstBattle.gd")
	battleClass.new()
	visible = false
