extends Node

#команда проигрыша анимки действия к обьекту и само действие в конкретный момент анимки
class_name CommandAnim

var phase = 0
var caster = null
var target = null
var animationName = ''
var animationFunc = null
var effects: Array = []
var isActiveBeholderEffects = false

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
	isActiveBeholderEffects = true

func endAnimation():
	caster.playAnim("stay")

func remove():
	var index = caster.commands.find(self)
	if index > -1:
		caster.commands.remove_at(index)

	if effects.size():
		for effect in effects:
			effect.remove()

	caster = null
	target = null
	animationFunc = null
	effects = []
	isActiveBeholderEffects = false

	queue_free()

func commandStart():
	caster.playAnim(animationName)

func commandProcess():
	pass	

func addSpecEffect(hitClass, position = SpecEffectAnim.positionList.middle):
	var effect = hitClass.instantiate()

	G.battleController.add_child(effect)
	effect.position = target.position

	if position == SpecEffectAnim.positionList.middle:
		effect.position.y -= target._mouse_hendler_area.size.y/2

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
