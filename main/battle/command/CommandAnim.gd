extends Node

#команда проигрыша анимки действия к обьекту и само действие в конкретный момент анимки
class_name CommandAnim

var caster = null
var target = null
var animationName = ''
var animationFunc = null
var effects = []
var isActiveBeholderEffects = false

func _init(caster, target, animationName, animationFunc):
	caster.commands.push_back(self) 
	self.caster = caster
	self.target = target
	self.animationName = animationName
	self.animationFunc = animationFunc
	G.battle.battleField.add_child(self)

func action():
	caster.playAnim(animationName)

#в нужный кадр анимации юнита вызывется его actionAnimation, а он вызовет эту ф-цию текущей команды
func actionAnimation():
	animationFunc.call()
	isActiveBeholderEffects = true

func endAnimation():
	caster.playAnim("stay")

func _process(delta: float) -> void:
	if isActiveBeholderEffects && effects.size() == 0:
		queue_free()
