extends Node

const SAVE_PATH = "user://save_config_file222.ini"

var BattleControllerClass = load("res://main/battle/BattleController.gd")
var СharacteristicWithMax = load("res://missons/star-wars/battle/characters/СharacteristicWithMax.gd")
var Unit = load("res://missons/star-wars/battle/characters/Unit.gd")

var mission = null

var x = 0

var battleController = BattleControllerClass.new()

func test():
	print('tfunc test main game')

# Called when the node enters the scene tree for the first time.
func _ready():
	var config = ConfigFile.new()
	config.load(SAVE_PATH)
	x = config.get_value("player", "health" , 1)
	
	
	var obj1 = СharacteristicWithMax.new('vbvb', 10)
	obj1.plus(100)
	obj1.minus(100)
	obj1.plus(3)
	
	Unit.new('vbvb')
	Unit.new('vbvb2')
	
#	battleController.nextCommand()
	test()
