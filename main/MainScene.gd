extends Node

func _on_button_pressed():
	var darkFunc = func ():
		get_tree().change_scene_to_file("res://main/battle/battles/FirstBattle.tscn")
	Dark.blackout(darkFunc)
