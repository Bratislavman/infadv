extends CommandParent

#команда проигрыша анимки действия к обьекту и само действие в конкретный момент анимки
class_name CommandAnim

var animationName = ''
var animationFunc = null

func _init(caster: Unit, target: Unit, animationName, animationFunc):
	caster.commands.push_back(self) 
	self.caster = caster
	self.target = target
	self.animationName = animationName
	self.animationFunc = animationFunc
	G.battleController.add_child(self)

#в нужный кадр анимации юнита вызывется его actionAnimation, а он вызовет эту ф-цию текущей команды
func actionAnimation():
	animationFunc.call()
	phase = 1
# также как выше, только под конец анимации
func endAnimation():
	caster.playAnim("stay")

func commandStart():
	caster.playAnim(animationName)
	super.commandStart()

func addSpecEffect(hitClass, position = SpecEffectAnim.positionList.middle):
	var effect = hitClass.instantiate()
	G.battleController.addEffectToScene(effect, target, position)
	effect.init(self)
	effects.append(effect)
func _process(delta: float) -> void:
	if phase == 0 && caster.checkCurrentCommand(self):
		commandStart()
		phase = 1 

	if phase == 1:	
		commandProcess()

	if isActiveBeholderEffects && effects.size() == 0:
		remove()
