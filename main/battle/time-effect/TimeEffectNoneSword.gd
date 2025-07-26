extends TimeEffect

# эффект блокировка атаки лазерного меча, когда его бросаешь
class_name TimeEffectNoneSword

func getInfo():
	var count = G.pluralizeCountMessage(countTurns, true)
	return ModalInfo.formatText('[b]Возвращение меча:[/b] После броска меча нужно время, что бы вернуть меч.' + count)	

func _init(target):
	countTurns = 3
	super._init(target)
