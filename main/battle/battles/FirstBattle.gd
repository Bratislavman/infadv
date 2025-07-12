extends Battle

class_name FirstBattle

func createScene():
	var rexClass = preload("res://main/battle/units/rex/Rex.tscn")
	var leoClass = preload("res://main/battle/units/leo/Leo.tscn")
	var maxClass = preload("res://main/battle/units/max/Max.tscn")
	var flyClass = preload("res://main/battle/units/fly/Fly.tscn")
	
	var rex = addUnit(rexClass, 1500, 933)
	var leo = addUnit(leoClass, 673, 1000)
	var max = addUnit(maxClass, 800, 1000, BattleController.BATTLE_SIDES.ENEMY)
	var fly = addUnit(flyClass, 880, 1000, BattleController.BATTLE_SIDES.ENEMY)

	G.battleController.start([leo, rex, max, fly])
