extends Node

const SAVE_PATH = "user://save_config_file222.ini"

var mission = null

var x = 0

func test():
	print(666)

# Called when the node enters the scene tree for the first time.
func _ready():
	var config = ConfigFile.new()
	config.load(SAVE_PATH)
	x = config.get_value("player", "health" , 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventKey and event.pressed:
			if event.keycode == KEY_Q:
				var config = ConfigFile.new()
				config.set_value("player", "health", x + 1)
				config.save(SAVE_PATH)
			if event.keycode == KEY_W:
				var config = ConfigFile.new()
				config.load(SAVE_PATH)
				print(config.get_value("player", "health"))




func _on_button_pressed():
	var StarWarsType = load("res://missons/star-wars/StarWars.gd")
	G.mission = StarWarsType.new()
	get_tree().change_scene_to_file("res://main/battle/Field.tscn")
