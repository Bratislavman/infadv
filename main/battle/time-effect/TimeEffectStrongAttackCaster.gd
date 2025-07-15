extends TimeEffect

class_name TimeEffectStrongAttackCaster

var relatedEffect = null
var specEffect = null
var relatedTarget = null

func _init(target, relatedTarget):
	isEndTurnUnit = true
	self.relatedTarget = relatedTarget
	relatedEffect = TimeEffectStrongAttackTarget.new(relatedTarget, self)
	countTurns = 3
	nameEffect = 'Подготовка к мощной атаке'
	descriptionEffect = 'Подготовка к атаке пропускает ход'

	specEffect = preload("res://main/battle/effects/target/Target.tscn").instantiate()
	G.battleController.addEffectToScene(specEffect, target, SpecEffectAnim.positionList.up)
	specEffect.init()

	super._init(target)

func remove():
	CommandAttackMeleeBig.new(target, relatedTarget)
	
	if relatedEffect != null:	
		relatedEffect.remove()
	relatedEffect = null

	if specEffect:	
		specEffect.remove()
	specEffect = null

	relatedTarget = null

	super.remove()
