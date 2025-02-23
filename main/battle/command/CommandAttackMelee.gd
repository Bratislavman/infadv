extends CommandAnim
class_name CommandAttackMelee

func _init(caster: Hero, target: Hero):
	caster.commands.push_back(self) 
	G.add_child(self)
	
	var dmg = func():
		target.dmg()
		
	super._init(caster, target, "unit/attack", dmg)
	
	caster.playAnim(animationName)
