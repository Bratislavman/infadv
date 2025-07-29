extends Unit

class_name Leo

func init():
	attributes[Attributes.attrNameDmg] = Attributes.new('Урон', 2)
	attributes[Attributes.attrNameHp] = Attributes.new('Жизни', 50)
	icon = preload("res://main/battle/units/leo/leo.jpg")
	unitName = 'Лео'
	unitBio = 'Классный малый'
	isPlayerHero = true
	spells = [SpellAttack.new(self), SpellHealth.new(self), SpellSwordThrow.new(self), SpellShoot.new(self), SpellTaming.new(self), SpellStrongAttack.new(self), SpellTightenUp.new(self)]
	super.init()
