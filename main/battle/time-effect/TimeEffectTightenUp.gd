extends TimeEffect

class_name TimeEffectTightenUp

func _init(caster, target):
	countTurns = 2
	name = 'TimeEffectTightenUp'
	self.target = target
	self.relatedTarget = caster
	super._init(target)

func getInfo():
	var count = G.pluralizeCountMessage(countTurns, true)
	return ModalInfo.formatText('[b]Притягивание:[/b] Союзник/вы спасёт вас в момент одной атаки в течении одного хода.')	

func remove():
	if relatedTarget && relatedTarget.isLive():
		CommandAnim.new(relatedTarget, target, 'spell', null)
	super.remove()