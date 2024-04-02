extends Node

class_name BattleController

const BATTLE_EVENTS = {
	'BEFORE_TAKING_DAMAGE': 'BEFORE_TAKING_DAMAGE',
	'START_UNIT': 'START_UNIT',
	'UNIT_DEATH': 'UNIT_DEATH',
}

const BATTLE_SIDES = {
	'HERO': 'HERO',
	'ENEMY': 'ENEMY',
	'NEUTRAL': 'NEUTRAL',
}

var isActive = false
var unitList = []
var commandList = []
var currentUnitIndex = -1
var currentCommandIndex = 0
var enemyList = []
var heroList = []
var unitSideList = null

func start(units):
	unitList = units
	nextUnit()
	isActive = true
	
func stop():
	isActive = false	
	unitList = []
	commandList = []
	currentUnitIndex = -1
	currentCommandIndex = 0

func getCurrUnit():
	return unitList[currentUnitIndex]

func nextUnit():
	var currIndex = currentUnitIndex + 1
	if (currIndex >= (unitList.size()-1)):
		currIndex = 0
	currentUnitIndex = currIndex
	var unit = getCurrUnit()
	unit.start()

func getEnemy(unit):
	var side = ''
	if (unit.side == BATTLE_SIDES.ENEMY):
		side =  BATTLE_SIDES.HERO
	if (unit.side == BATTLE_SIDES.HERO):
		side =  BATTLE_SIDES.ENEMY
	for enemy in unitList:
		if (enemy.side == side):
			return enemy

func getCurrCommand():
	return commandList[currentCommandIndex]
	
func getCurrCommandId():
	return getCurrCommand().id
	
func replaceCurrCommand(comm):
	commandList.insert(currentCommandIndex, comm)

func nextCommand():
	var command = getCurrCommand()
	command.isActive = false
	var currIndex = currentCommandIndex + 1
	if (currIndex <= (commandList.size()-1)):
		currentCommandIndex = currIndex
		
func haveActiveCommands():
	for comm in commandList:
		if (comm.isActive):
			return true
	return false

func pushEvent(event):
	for unit in unitList:
		if (unit.efects.size()):
			for efect in unit.efects:
				efect.action(event)

func checkEndBattle():
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
		print(unit.id, ' unit id//')
		print(unit.chrs.HP.value, ' HP//')
		if (unit.side != BATTLE_SIDES.NEUTRAL):
			unitSideList[unit.side].all.append(unit)
			if (unit.isDeath()):
				unitSideList[unit.side].death.append(unit) 
			else:
				unitSideList[unit.side].live.append(unit)
 
	var enemyDeath = (
		unitSideList[BATTLE_SIDES.HERO].death.size()
		==
		unitSideList[BATTLE_SIDES.HERO].all.size()
	)	
	var heroDeath = (
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
	print(sideWinner, 'END///')
	stop()

func moveUnit(obj):
	pass

#когда бой, если есть актив команд, то исполняем текущую
#иначе текущий юнит(если он не в команде игрока) делает действие	
func processBC():
	if (isActive):
		if (!checkEndBattle()):
			if (haveActiveCommands()):
				var command = getCurrCommand()
				if (command):
					command.actionProcess()
			else:
				var unit = getCurrUnit()
				if unit:
					print(unit.chrs.HP.value, unit.id, ' hp')
					if (unit.isDeath()):
						nextUnit()
					else:
						unit.action()
