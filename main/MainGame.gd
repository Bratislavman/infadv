extends Node

# const SAVE_PATH = "user://save_config_file222.ini"

var mission = null
var battleController = BattleController.new()
var battleField = null

func _ready():
	print('reasy')
#	var config = ConfigFile.new()
#	config.load(SAVE_PATH)
#	x = config.get_value("player", "health" , 1)

func _process(_delta):
	battleController.action()

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_A:
			var darkFunc = func ():
				get_tree().change_scene_to_file("res://main/battle/Field.tscn")
			Dark.blackout(darkFunc)
		if event.keycode == KEY_S:
			get_tree().change_scene_to_file("res://main/MainScene.tscn")
