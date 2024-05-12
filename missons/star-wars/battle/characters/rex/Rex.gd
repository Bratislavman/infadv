extends Unit

class_name Rex

func _init(title = 'vb', side = 'cvb'):
	super._init(title,'Великий воин', side)
#	self.spells = [Attack.new(self), AttackDouble.new(self)]
	self.spells = [Attack.new(self)]
#	self.effects = [Counterattack.new(self)]

func chrsInit():
	var hp = Сharacteristic.CHARACTERISTICS.HP
	var dmg = Сharacteristic.CHARACTERISTICS.DMG
	chrs = {
		hp: СharacteristicWithMax.new(Сharacteristic.CHARACTERISTICS.HP, 2),
		dmg: Сharacteristic.new(Сharacteristic.CHARACTERISTICS.DMG, 1),
	}

#тут будет иниц спел и всё что ему нужно
func actionAI(activeSpells):
	var enemy = G.battleController.getEnemy(self)
	var activeSpelf = activeSpells.pick_random()
	if (activeSpelf is SpellOneTarget):
		activeSpelf.action(enemy)
	
	
