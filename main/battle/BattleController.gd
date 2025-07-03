extends Node

class_name BattleController

const BATTLE_EVENTS = {
	'BEFORE_TAKING_DAMAGE': 'BEFORE_TAKING_DAMAGE',
	'START_UNIT': 'START_UNIT',
	'UNIT_DEATH': 'UNIT_DEATH',
}

const BATTLE_SIDES = {
	"HERO": 'HERO',
	"ENEMY": 'ENEMY',
	"NEUTRAL": 'NEUTRAL',
}

var isActive = false
var unitList = []
var currentUnitIndex = 0
var unitSideList = null

var heroIconClass = preload("res://main/battle/ui/UnitIcon.tscn")

func initUnitsIcons():
	var iconListContainer = G.battle.battleField.get_node('UnitIconList/Control/ScrollContainer/HBoxContainer')
	
	var icons = iconListContainer.get_children()

	for item in icons:
		item.queue_free()

	for unit in unitList:
		var icon = heroIconClass.instantiate()
		iconListContainer.add_child(icon)
		icon.init(unit)

func start(units):
	unitList = units
	isActive = true
	initUnitsIcons()
	
func stop():
	isActive = false	
	for unit in unitList:
		unit.remove()
	unitList = []
	currentUnitIndex = 0

func getCurrUnit():
	return unitList[currentUnitIndex]
	
func isCurrUnit(id):
	var unit = getCurrUnit()
	if (unit):
		return unit.get_instance_id() == id
	return false

func nextUnit():
	var nextIndex = currentUnitIndex + 1
	if (nextIndex > (unitList.size()-1)):
		nextIndex = 0
	currentUnitIndex = nextIndex

func getEnemyList(unit):
	var list = []
	var side = ''
	if (unit.side == BATTLE_SIDES.ENEMY):
		side =  BATTLE_SIDES.HERO
	if (unit.side == BATTLE_SIDES.HERO):
		side =  BATTLE_SIDES.ENEMY
	if (unit.side == BATTLE_SIDES.NEUTRAL):
		side = [BATTLE_SIDES.HERO, BATTLE_SIDES.ENEMY].pick_random()
	for enemy in unitList:
		if (enemy.side == side):
			list.append(enemy)
	return list

func beholderEndBattle():
	unitSideList = {
		'HERO': {
			'live': [],
			'death': [],
			'all': []
		},
		'ENEMY': {
			'live': [],
			'death': [],
			'all': []
		}
	}

	for unit in unitList:
		if (unit.side != BATTLE_SIDES.NEUTRAL):
			unitSideList[unit.side].all.append(unit)
			if (unit.isDeath()):
				unitSideList[unit.side].death.append(unit) 
			else:
				unitSideList[unit.side].live.append(unit)
 
	var heroDeath = (
		unitSideList[BATTLE_SIDES.HERO].death.size()
		==
		unitSideList[BATTLE_SIDES.HERO].all.size()
	)	
	var enemyDeath = (
		unitSideList[BATTLE_SIDES.ENEMY].death.size()
		==
		unitSideList[BATTLE_SIDES.ENEMY].all.size()
	)
	var allDeath = enemyDeath && heroDeath

	if (allDeath):
		endBattle(BATTLE_SIDES.NEUTRAL)
		return true
	else:	
		if (heroDeath):
			endBattle(BATTLE_SIDES.ENEMY)	
			return true
		else:
			if (enemyDeath):
				endBattle(BATTLE_SIDES.HERO)
				return true
	return false	
		
func endBattle(sideWinner):
	print(sideWinner)
	stop()
						
func action():
	if (isActive):
		pass
		# beholderEndBattle()				
