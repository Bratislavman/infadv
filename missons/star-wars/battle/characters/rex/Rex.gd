extends Unit

class_name Rex

func _init():
	super._init()
	title = 'Рекс'
	spells = [Attack.new(self)]
#	self.effects = [Counterattack.new(self)]
	chrs[Сharacteristic.CHARACTERISTICS.HP].value = 10

#тут будет иниц спел и всё что ему нужно
func actionAI(activeSpells):
	var enemy = G.battleController.getEnemy(self)
	var activeSpelf = activeSpells.pick_random()
	if (activeSpelf is SpellOneTarget):
		activeSpelf.action(enemy)
