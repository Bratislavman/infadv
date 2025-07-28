extends TimeEffectChild

class_name TimeEffectStrongAttackTarget

func _init(target, relatedEffect):
	self.relatedEffectParent = relatedEffect
	countTurns = 3
	nameEffect = 'Цель мощной атаки'
	name='TimeEffectStrongAttackTarget'
	descriptionEffect = 'В скорем времени вы получите мощный урон'

	specEffect = preload("res://main/battle/effects/target/Target.tscn").instantiate()
	G.battleController.addEffectToScene(specEffect, target, SpecEffectAnim.positionList.up)
	specEffect.init()

	super._init(target)