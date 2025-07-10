extends TimeEffect

# эффект блокировка атаки лазерного меча, когда его бросаешь
class_name TimeEffectNoneSword

func _init(target):
	countTurns = 1
	super._init(target)