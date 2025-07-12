extends Unit

class_name Leo

func init():
	attributes[Attributes.attrNameDmg] = Attributes.new('Урон', 2)
	attributes[Attributes.attrNameHp] = Attributes.new('Жизни', 10)
	icon = preload("res://main/battle/units/leo/leo.jpg")
	unitName = 'Лео'
	isPlayerHero = true
	spells = [SpellAttack.new(self), SpellHealth.new(self), SpellSwordThrow.new(self), SpellShoot.new(self)]
	super.init()
