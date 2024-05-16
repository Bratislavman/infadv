extends Node2D
 
class_name Unit

static var ids = 0

var animPlayer = null
var positionPlace = null

var id = 0

var side = ''

var x = 0
var y = 0

var title = ""
var bio = ""
var spells = []
var effects = []
var chrs = {}

var countMove = 1
var countActions = 1

var commandList = []

func _init():
	Unit.ids += 1
	id = Unit.ids
	chrsInit() 
	
func _ready():
	animPlayer = get_node("Sprite2D/AnimationPlayer")
	animPlayer.play('stay')

func actionAI(spells):
	pass	

func chrsInit():
	var hpKey = Сharacteristic.CHARACTERISTICS.HP
	var dmgKey = Сharacteristic.CHARACTERISTICS.DMG
	chrs = {
		hpKey: СharacteristicWithMax.new(Сharacteristic.CHARACTERISTICS.HP, 1),
		dmgKey: Сharacteristic.new(Сharacteristic.CHARACTERISTICS.DMG, 1),
	}

func start():
	countMove = 1
	countActions = 1
	if (spells.size()):
		for spell in spells:
			spell.reload()
	if (effects.size()):
		for effect in effects:
			effect.action(G.battleController.BATTLE_EVENTS.START_UNIT)

func isDeath():
	return chrs[Сharacteristic.CHARACTERISTICS.HP].value == 0
			
func action():
	# if (countMove > 0 && RandomNumberGenerator.new().randi_range(1,2) == 1):
	# 	countMove-=1
	# 	G.battleController.moveUnit(self)

	if (countActions > 0):
		countActions-=1
		activeSpell()
			
	if (commandList.size() == 0 && (countMove == 0 || countActions == 0)):
		G.battleController.nextUnit()
	
func checkActiveSpell(spell):	
	return spell.isActive()
		
func activeSpell():
	var activeSpells = spells.filter(checkActiveSpell)
	actionAI(activeSpells)

func removeEffect(effect):
#	effects.remove_at()	
	pass
	
func damage(dmg):
	chrs.HP.minus(dmg)
	if isDeath():
		playAnim('death')


func getCurrCommand():
	if (commandList.size()):
		return commandList[0]
	return null

func removeCommand(id):
	if (commandList.size()):
		for index in commandList.size():
			var comm = commandList[index] 
			if comm.id == id:	
				commandList.remove_at(index)
				return
	return null
	
func playAnim(anim):
	animPlayer.play(anim)

func effAnim(eff):
	# момент применения эффекта спела в анимке атаки персонажа
	if (eff): 
		var currComm = getCurrCommand()
		if currComm as CommandCast:
			currComm.action()


func _on_animation_player_animation_finished(_anim_name):
	var currComm = getCurrCommand()
	if currComm as CommandCast:
		currComm.endAnimation()

	if (!isDeath()):
		animPlayer.play('stay')

func _process(_delta):
	if G.battleController.isActive:
		if (getCurrCommand() == null):
			if G.battleController.isCurrUnit(id):
				if (isDeath()):
					print(999)
					animPlayer.play('death')
					G.battleController.nextUnit()
				else:
					action()
