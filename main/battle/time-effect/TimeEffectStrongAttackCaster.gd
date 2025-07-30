extends TimeEffect

class_name TimeEffectStrongAttackCaster

func _init(target, relatedTarget):
	isEndTurnUnit = true
	self.relatedTarget = relatedTarget
	relatedEffectChild = TimeEffectStrongAttackTarget.new(relatedTarget, self)
	countTurns = 3
	nameEffect = 'Подготовка к мощной атаке'
	name='TimeEffectStrongAttackCastert'
	descriptionEffect = 'Подготовка к атаке пропускает ход'

	specEffect = preload("res://main/battle/effects/target/Target.tscn").instantiate()
	G.battleController.addEffectToScene(specEffect, target, SpecEffectAnim.positionList.up)
	specEffect.init()

	super._init(target)

func remove():
	CommandAttackMeleeBig.new(target, relatedTarget)
	super.remove()

func getInfo():
	return ModalInfo.formatText('[b]Подготовка сильной атаки:[/b] После подготовки будет нанесена мощная атака.')	
