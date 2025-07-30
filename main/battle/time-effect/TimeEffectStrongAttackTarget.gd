extends TimeEffectChild

class_name TimeEffectStrongAttackTarget

func _init(target, relatedEffect):
	self.relatedEffectParent = relatedEffect
	nameEffect = 'Цель мощной атаки'
	name='TimeEffectStrongAttackTarget'
	descriptionEffect = 'В скорем времени вы получите мощный урон'

	specEffect = preload("res://main/battle/effects/target/Target.tscn").instantiate()
	G.battleController.addEffectToScene(specEffect, target, SpecEffectAnim.positionList.up)
	specEffect.init()

	super._init(target)

func getInfo():
	return ModalInfo.formatText('[b]Цель сильной таки:[/b] Когда враг будет готов, он нанесёт вам мощный урон.')