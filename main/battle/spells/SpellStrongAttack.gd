extends Spell

class_name SpellStrongAttack

func _init(caster):
	icon = preload("res://main/battle/icons/throw.jpg")
	spellName = 'Могучая атака' 
	reloadCount = 6
	super._init(caster)

func postSpellAction():
	CommandStrongAttack.new(caster, target)

func getInfo():
	var text = '[b]Мощная атака:[/b] В течении 3 ходов готовится сильная атака, что пропускает ход, затем наносится сильный урон.'
	return ModalInfo.formatText(text, true)