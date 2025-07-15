extends TimeEffect

class_name TimeEffectStrongAttackTarget

var relatedEffect = null
var specEffect = null

func _init(target, relatedEffect):
	self.relatedEffect = relatedEffect
	countTurns = 3
	nameEffect = 'Цель мощной атаки'
	descriptionEffect = 'В скорем времени вы получите мощный урон'

	specEffect = preload("res://main/battle/effects/target/Target.tscn").instantiate()
	G.battleController.addEffectToScene(specEffect, target, SpecEffectAnim.positionList.up)
	specEffect.init()

	super._init(target)

func remove():
	relatedEffect = null

	if specEffect:	
		specEffect.remove()
	specEffect = null
		
	super.remove()