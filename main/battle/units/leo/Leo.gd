extends Unit

class_name Leo

func init():
	attributes[Attributes.attrNameDmg] = Attributes.new('Урон', 2)
	attributes[Attributes.attrNameHp] = Attributes.new('Жизни', 10)
	icon = preload("res://main/battle/units/leo/leo.jpg")
	super.init()
