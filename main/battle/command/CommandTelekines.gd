extends CommandParent

class_name CommandTelekines

func _init(caster):
	super._init()
	self.caster = caster
	caster.playAnim('stand')
	caster.showShaderBlue()

func endMove():
	caster.showShaderBlue()