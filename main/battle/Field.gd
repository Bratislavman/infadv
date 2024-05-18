extends Node2D

var cellListAll = []
var cellListEnemy = []
var cellListHero = []

func createUnit(sceneClass, x, y, side):
	var unit = sceneClass.instantiate()
	var cellNode = getCellByCoord(x, y, side)
	unit.position = cellNode.position
	cellNode.unit = unit
	unit.side = side
	G.battleField.add_child(unit)
	return unit

func getCell(funcSearch):
	if (funcSearch && cellListAll.size()):
		for index in cellListAll.size():
			var cell = cellListAll[index] 
			if funcSearch.call(cell):
				return cell
	return null

func getCellByCoord(x, y, side):
	var search = func(cell):
		return cell.x == x && cell.y == y && cell.side == side 
	return getCell(search)

func getCellById(id, side):
	var search = func(cell):
		return cell.get_instance_id() == id && cell.side == side 
	return getCell(search)

func getCellByUnit(unit):
	return getCellByCoord(unit.x, unit.y, unit.side)

func getFreeCell(unit):
	var list = cellListEnemy
	if unit.side == G.battleController.BATTLE_SIDES.HERO:
		list = cellListHero
	
	if list.size() == 0:
		return null

	var getList = func(cell):
		return cell.get_instance_id()

	var ids = list.map(getList)
	var randomId = null
	var currCell = null

	while ids.size():
		randomId = ids.pick_random()
		currCell = getCellById(randomId, unit.side)
		if (currCell.unit == null):
			return currCell
		else:
			ids.erase(randomId)

func _ready():
	G.battleField = self

	cellListAll = get_tree().get_nodes_in_group('all')
	cellListEnemy = get_tree().get_nodes_in_group('enemy')
	cellListHero = get_tree().get_nodes_in_group('hero')

	get_node("bg").texture = preload('res://missons/star-wars/battle/battles/beast/bg.jpg')

	var rexScene = preload('res://missons/star-wars/battle/characters/rex/Rex.tscn')

	var npc1 = createUnit(rexScene, 3, 2, G.battleController.BATTLE_SIDES.HERO)
	var npc2 = createUnit(rexScene, 1, 2, G.battleController.BATTLE_SIDES.ENEMY)

	G.battleController.start([npc1, npc2])
