extends Node

class_name BattleController

static var BATTLE_EVENTS = {
	'BEFORE_TAKING_DAMAGE': 'BEFORE_TAKING_DAMAGE',
	'START_UNIT': 'START_UNIT',
	'UNIT_DEATH': 'UNIT_DEATH',
}

static var BATTLE_SIDES = {
	"HERO": 'HERO',
	"ENEMY": 'ENEMY',
	"NEUTRAL": 'NEUTRAL',
}

var isActive = false

var unitList = []
var currentUnitIndex = 0
var unitSideList = null

# спел персонажа, который выбрал/кликнул игрок
var currentPlayerSelectSpell = null
# персонаж, над которым мышка
var unitMouseExited = null

var heroIconClass = preload("res://main/battle/ui/UnitIcon.tscn")
var heroIconSpellClass = preload("res://main/battle/ui/UnitIconSpell.tscn")

var iconCursorDefault = load("res://main/ui/cursor.png")
var iconCursorNone = load("res://main/ui/cursor-none.png")
var iconCursorSpell = load("res://main/ui/force.png")

func checkCantUsePlayerSelectedSpell():
	return currentPlayerSelectSpell && unitMouseExited && currentPlayerSelectSpell.targetType == Spell.targetTypeList.enemy && !currentPlayerSelectSpell.caster.unitIsEnemy(unitMouseExited)

func beholderMouseIcon():
	if checkCantUsePlayerSelectedSpell():
		Input.set_custom_mouse_cursor(iconCursorNone)
		return

	if currentPlayerSelectSpell:
		Input.set_custom_mouse_cursor(iconCursorSpell)
		return

	Input.set_custom_mouse_cursor(iconCursorDefault)

func unitMouseEnteredHandler(unit):
		unitMouseExited = unit

func unitMouseLeftClickHandler(unit):
	if currentPlayerSelectSpell && unit:
		var playerHero = getCurrPlayerUnit()
		if (playerHero && !checkCantUsePlayerSelectedSpell()):
			playerHero.useSpell(currentPlayerSelectSpell, [unit])
			currentPlayerSelectSpell = null

func playerSelectSpell(spell):
	currentPlayerSelectSpell = spell

func initUnitsIcons():
	var iconListContainer = G.battleController.get_node('UnitIconList/ScrollContainer/HBoxContainer')
	
	var icons = iconListContainer.get_children()

	for item in icons:
		item.queue_free()

	for unit in unitList:
		var icon = heroIconClass.instantiate()
		iconListContainer.add_child(icon)
		icon.init(unit)

func initPlayerUnitIconsSpells():
	var iconListContainer = G.battleController.get_node('UnitIconSpellList/ScrollContainer/HBoxContainer')
	
	var icons = iconListContainer.get_children()

	for item in icons:
		item.queue_free()

	var unit = getCurrPlayerUnit()
	
	if unit:
		for spell in unit.spells:
			var icon = heroIconSpellClass.instantiate()
			iconListContainer.add_child(icon)
			icon.init(spell)

func start(units):
	unitList = units
	isActive = true
	initUnitsIcons()
	initPlayerUnitIconsSpells()
	
func stop():
	isActive = false
	for unit in unitList:
		unit.remove()
	unitList = []
	currentUnitIndex = 0

func getCurrUnit():
	if unitList.size():
		return unitList[currentUnitIndex]
	return null

func getCurrPlayerUnit():
	var unit = getCurrUnit()
	if unit && unit.isPlayerHero:
		return unit
	return null	
	
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
	
	initPlayerUnitIconsSpells()

	var unit = getCurrUnit()
	unit.reloadSpells()

func getEnemyList(unit, onlyLive = true):
	var list = []
	var side = ''
	if (unit.side == BATTLE_SIDES.ENEMY):
		side =  BATTLE_SIDES.HERO
	if (unit.side == BATTLE_SIDES.HERO):
		side =  BATTLE_SIDES.ENEMY
	for enemy in unitList:
		if (enemy.side == side && (onlyLive && enemy.isLive())):
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
	print(sideWinner, ' BATTLE END')
	stop()
						
func action():
	if (isActive):
		beholderEndBattle()
		beholderMouseIcon()		

func _on_end_turn_button_down() -> void:
	var unit = getCurrPlayerUnit()
	if unit:
		unit.endTurn()
