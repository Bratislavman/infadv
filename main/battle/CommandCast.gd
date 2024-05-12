extends CommandParent
#команда проигрыша анимки спела и дейстие после этого
class_name CommandCast

var caster = null
var target = null
var animationName = ''
var animationFunc = null
var phase = 0

func _init(caster, target, animationName, animationFunc):
	super._init()
	self.caster = caster
	self.target = target
	self.animationName = animationName
	self.animationFunc = animationFunc
	caster.playAnim(animationName)

#когда анимация юнита дошла до момента экшена, совершаем действие
func action():
	animationFunc.call()

#когда анимация завершилась, убиваем команду
func endAnimation():
	caster.removeCommand(id)
