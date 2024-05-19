extends CommandParent
#команда проигрыша анимки спела и действие в конкретный момент анимки
class_name CommandCast

var target = null
var animationName = ''
# animationFunc вызывается в effAnim у юнита
# применяется во время конкретного кадра анимки персонажа
var animationFunc = null

func _init(caster, target, animationName, animationFunc):
	super._init()
	self.caster = caster
	self.target = target
	self.animationName = animationName
	self.animationFunc = animationFunc
	caster.playAnim(animationName)

#когда анимация завершилась, убиваем команду
func endAnimation():
	caster.removeCommand(id)
