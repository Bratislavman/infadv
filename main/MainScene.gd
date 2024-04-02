extends Node

func _input(event):
	if event is InputEventKey and event.pressed:
			if event.keycode == KEY_Q:
				var config = ConfigFile.new()
				config.set_value("player", "health", G.x + 1)
				config.save(G.SAVE_PATH)
			if event.keycode == KEY_W:
				var config = ConfigFile.new()
				config.load(G.SAVE_PATH)

func _on_button_pressed():
	var StarWarsType = load("res://missons/star-wars/StarWars.gd")
	G.mission = StarWarsType.new()
	get_tree().change_scene_to_file("res://main/battle/Field.tscn")
