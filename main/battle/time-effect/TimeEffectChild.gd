extends TimeEffect

# дочерний эффект, который уничтожит родитель в момент исполнения, очистив relatedEffectChild
class_name TimeEffectChild

func _init(target):
	countTurns = 1
	super._init(target)

func effectCountTurnsMinus():
	pass