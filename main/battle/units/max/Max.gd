extends Unit

class_name Max

func init():
	attributes[Attributes.attrNameDmg] = Attributes.new('Урон', 2)
	attributes[Attributes.attrNameHp] = Attributes.new('Жизни', 10)
	icon = preload("res://main/battle/units/max/max.jpg")
	super.init()
