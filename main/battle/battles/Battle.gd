extends Node2D

class_name Battle

var battleField

func _init():
	var darkFunc = func ():
		var fieldClass = preload("res://main/battle/Field.tscn")
		battleField = fieldClass.instantiate()
		G.add_child(battleField)

		G.battle = self

		createScene()

		G.battleController.isActive = true

	Dark.blackout(darkFunc)

func addUnit(unitClass, x, y, side = G.battleController.BATTLE_SIDES.HERO):
	var unit = unitClass.instantiate()
	G.battle.battleField.add_child(unit)
	unit.position.x = x
	unit.position.y = y
	unit.side = side
	return unit

func createScene():
	pass	

func remove():
	G.battle = null
	battleField.queue_free()
	battleField = null
	queue_free()	
