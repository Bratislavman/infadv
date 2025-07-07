extends Node2D

class_name Battle

func _init():
	var darkFunc = func ():
		G.battle = self
		G.battleController.visible = true

		createScene()

		G.battleController.isActive = true

	Dark.blackout(darkFunc)

func addUnit(unitClass, x, y, side = G.battleController.BATTLE_SIDES.HERO):
	var unit = unitClass.instantiate()
	G.battleController.add_child(unit)
	unit.position.x = x
	unit.position.y = y
	unit.side = side
	return unit

func createScene():
	pass	

func remove():
	G.battle = null
	queue_free()	
