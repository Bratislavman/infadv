extends Unit

class_name Rex

func _init():
	super._init()
	title = 'Рекс'
	spells = [Attack.new(self)]
#	self.effects = [Counterattack.new(self)]
	chrs[Сharacteristic.CHARACTERISTICS.HP].value = 10

#тут будет иниц спел и всё что ему нужно
func activeSpellAI(activeSpells):
	var enemy = G.battleController.getEnemyList(self)[0]
	var activeSpelf = activeSpells.pick_random()
	if (activeSpelf is SpellOneTarget):
		activeSpelf.action(enemy)
