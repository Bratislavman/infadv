extends Node

const SAVE_PATH = "user://save_config_file222.ini"


var mission = null

var x = 0

var battleController = BattleController.new()

func test():
	print('tfunc test main game')

# Called when the node enters the scene tree for the first time.
func _ready():
	print('reasy')
#	var test_var = func is_positive():
#		return 10 + 20
#
#	print(test_var.call()) # true
#	var config = ConfigFile.new()
#	config.load(SAVE_PATH)
#	x = config.get_value("player", "health" , 1)

	# battleController.start([
	# 	Rex.new('Рекс I', battleController.BATTLE_SIDES.HERO),
	# 	Rex.new('Рекс II', battleController.BATTLE_SIDES.ENEMY),
	# ])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	battleController.action()

