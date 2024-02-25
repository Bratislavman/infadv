extends Unit

class_name Rex

func _init(title, spells, side):
	super._init(title,'Великий воин')
	self.spells = [Attack.new(), AttackDouble.new()]
	self.effects = [Counterattack.new()]
	self.side = side

func chrsInit():
	chrs = {
		[Сharacteristic.CHARACTERISTICS.HP]: СharacteristicWithMax.new(Сharacteristic.CHARACTERISTICS.HP, 20),
		[Сharacteristic.CHARACTERISTICS.DMG]: Сharacteristic.new(Сharacteristic.CHARACTERISTICS.DMG, 1),
	}

#на самом деле до выбора спела мы должны определить цели для спела
func actionAI(spells):
	var enemy = G.battleController.getEnemy(self)
	spells.pick_random().action(enemy)
