extends Node2D

var npc = null

func createUnit(sceneClass, posNode, side):
	var unit = sceneClass.instantiate()
	unit.position = posNode.position
	unit.side = side
	G.battleField.add_child(unit)
	return unit

func _ready():
	G.battleField = self

	get_tree().call_group('all', 'chc')
	get_node("bg").texture = preload('res://missons/star-wars/battle/battles/beast/bg.jpg')

	print('READY66')

	var rexScene = preload('res://missons/star-wars/battle/characters/rex/Rex.tscn')
	var heroPos = get_node("Cell1_3Hero")
	var u = createUnit(rexScene, heroPos, G.battleController.BATTLE_SIDES.HERO)

	u.damage(10)

	# var rexScene = preload('res://missons/star-wars/battle/characters/rex/Rex.tscn')



	# npc = rexScene.instantiate()
	# var heroPost = get_node("Cell1_3Hero")
	# npc.position = heroPost.position
	# npc.title = 'Рекс I'
	# npc.side = G.battleController.BATTLE_SIDES.HERO
	# add_child(npc)

	# var npc2 = rexScene.instantiate()
	# var heroPost2 = get_node("Cell2_3Hero")
	# npc2.position = heroPost2.position
	# npc2.title = 'Рекс 2'
	# npc2.side = G.battleController.BATTLE_SIDES.ENEMY
	# add_child(npc2)

	# G.battleController.start([npc, npc2])
