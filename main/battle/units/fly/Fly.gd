extends Unit

class_name Fly

func init():
	attributes[Attributes.attrNameDmg] = Attributes.new('Урон', 2)
	attributes[Attributes.attrNameHp] = Attributes.new('Жизни', 10)
	icon = preload("res://main/battle/units/fly/fly.jpg")
	unitName = 'Мышеястреб'
	tags = [Unit.unitTypeList.flying, Unit.unitTypeList.animal]
	spells = [SpellAttack.new(self)]
	super.init()
