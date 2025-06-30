extends Node

# var RexSc = preload("res://missons/star-wars/battle/characters/rex/Rex.tscn")

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
	# var battleClass = preload("res://missons/star-wars/battle/battles/beast/BattleBeast.gd")
	# G.mission = battleClass.new()

	# heroUp 165 381, heroDown 158 571, heroMiddle 365 474
	# enemyUp1 795 387, enemyUp2 987 355, enemyMiddle 673 472, enemyDown1 800 600, enemyDown2 987 585

	get_tree().change_scene_to_file("res://main/battle/Field.tscn")
