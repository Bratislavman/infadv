extends Node

class_name BattleController

const BATTLE_EVENTS = {
	'BEFORE_TAKING_DAMAGE': 'BEFORE_TAKING_DAMAGE',
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
var currentCommandIndex = -1

func start(units):
	unitList = units
	nextUnit()
	isActive = true
	
func stop():
	isActive = false	
	unitList = []
	commandList = []
	currentUnitIndex = -1
	currentCommandIndex = -1

func getCurrUnit():
	return unitList[currentUnitIndex]

func nextUnit():
	var currIndex = currentUnitIndex + 1
	if (currIndex >= (unitList.size()-1)):
		currIndex = 0
	currentUnitIndex = currIndex
	var unit = getCurrUnit()
	unit.start()

func getCurrCommand():
	return commandList[currentCommandIndex]
	
func getCurrCommandId():
	return getCurrCommand().id
	
func replaceCurrCommand(comm):
	commandList.insert(currentCommandIndex, comm)

func nextCommand():
	var currIndex = currentCommandIndex + 1
	if (currIndex < (commandList.size()-1)):
		currentCommandIndex = currIndex	
		
func haveActiveCommands():
	for comm in commandList:
		if (comm.isActive):
			return true

func pushEvent(event):
	for unit in unitList:
		if (unit.efects.size()):
			for efect in unit.efects:
				efect.action(event)
	
#когда бой, если есть актив команд, то исполняем текущую
#иначе текущий юнит(если он не в команде игрока) делает действие	
func _process(del):
	if (isActive):
		if (haveActiveCommands()):
			var command = getCurrCommand()
			if (command.isActive):
				command.actionProcess()
		else:
			var unit = getCurrUnit()
			if (unit.isDeath()):
				nextUnit()
			else:
				unit.action()
