extends Node

const SAVE_PATH = "user://save_config_file222.ini"


var mission = null

var x = 0

var battleController = BattleController.new()

func test():
	print('tfunc test main game')

# Called when the node enters the scene tree for the first time.
func _ready():
#	var config = ConfigFile.new()
#	config.load(SAVE_PATH)
#	x = config.get_value("player", "health" , 1)
	print(battleController)
	battleController.start([
		Rex.new('Рекс 1', battleController.BATTLE_SIDES.HERO),
		Rex.new('Рекс 2', battleController.BATTLE_SIDES.ENEMY),
	])
	
func _process(_delta):
	battleController.processBC()
