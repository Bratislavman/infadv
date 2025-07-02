extends Battle

class_name FirstBattle

func createScene():
	var rexClass = preload("res://main/battle/units/rex/Rex.tscn")
	var rex = rexClass.instantiate()

	G.battle.battleField.add_child(rex)
	rex.position.x = 673
	rex.position.y = 933

	G.battleController.start([rex])
