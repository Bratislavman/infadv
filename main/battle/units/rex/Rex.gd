extends Unit

class_name Rex

func init():
	attributes[Attributes.attrNameDmg] = Attributes.new('Урон', 2)
	attributes[Attributes.attrNameHp] = Attributes.new('Жизни', 10)
	icon = preload("res://main/battle/units/rex/rex.jpg")
	super.init()
