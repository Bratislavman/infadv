extends Spell

class_name SpellAttack

func postSpellAction():
	caster.commands.append(CommandAttackMelee.new(caster, target))
