extends Effect

class_name Counterattack

var reflectedAttackCommandId = 0

func _init(target):
	super._init(target, [G.battleController.BATTLE_EVENTS.BEFORE_TAKING_DAMAGE])
	
func preaction(event):
#	if (event == G.battleController.BATTLE_EVENTS.BEFORE_TAKING_DAMAGE):
#		var currCommId = G.battleController.getCurrCommandId()
#		var currComm = G.battleController.getCurrCommand()
#		if (reflectedAttackCommandId != currCommId):
#			reflectedAttackCommandId = currCommId
#			var comm = CommandAttack.new(currComm.creator, 1)
#			G.battleController.replaceCurrCommand(comm)
#		return true
	return false
