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

func createScene():
	pass	

func remove():
	G.battle = null
	battleField.queue_free()
	battleField = null
	queue_free()	
