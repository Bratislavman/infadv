extends Spell

#спел на одну цель
class_name SpellOneTarget

var caster = null
var target = null

func _init(caster):
	self.caster = caster
	
func action(target):
	preSpellAction()
	self.target = target
