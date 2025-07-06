extends Battle

class_name FirstBattle

func createScene():
	var rexClass = preload("res://main/battle/units/rex/Rex.tscn")
	var leoClass = preload("res://main/battle/units/leo/Leo.tscn")
	var maxClass = preload("res://main/battle/units/max/Max.tscn")
	
	var rex = addUnit(rexClass, 673, 933)
	var leo = addUnit(leoClass, 673, 1000)
	var max = addUnit(maxClass, 800, 1000, G.battleController.BATTLE_SIDES.ENEMY)

	G.battleController.start([rex, leo, max])
