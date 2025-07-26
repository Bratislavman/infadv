extends Spell

class_name SpellAttack

func _init(caster):
	icon = preload("res://main/battle/icons/attack.jpg")
	spellName = 'Атака' 
	super._init(caster)

func postSpellAction():
	CommandAttackMelee.new(caster, target)

func getInfo():
	var dmgConst = caster.attributes[Attributes.attrNameDmg].value
	var text = '[b]Атака:[/b] Наносит наземной цели урон [color=#ED2600]' + str(dmgConst) + ' ед.[/color]'
	return ModalInfo.formatText(text, true)
