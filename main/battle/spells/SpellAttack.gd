extends Spell

class_name SpellAttack

func postSpellAction():
	CommandAttackMelee.new(caster, target)
