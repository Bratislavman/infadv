extends SpellOneTarget

class_name SpellTelekines

func action(target):
	super.action(target)
	var freeCell = G.battleField.getFreeCell(self)
	if (freeCell):
		caster.cell.unit = null
		caster.cell = freeCell
		unit.movePos = cell.position
		caster.commandList.append(CommandTelekines.new(caster))
