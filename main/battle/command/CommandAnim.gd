extends Node

#команда проигрыша анимки действия к обьекту и само действие в конкретный момент анимки
class_name CommandAnim

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
	G.battleField.add_child(self)
	caster.playAnim(animationName)

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
				removeEffect(effect)
		queue_free()	

func removeEffect(obj):
	var index = effects.find(obj)
	if index > -1:
		effects[index].queue_free()
		effects.remove_at(index)

func _process(delta: float) -> void:
	if isActiveBeholderEffects && effects.size() == 0:
		remove()
