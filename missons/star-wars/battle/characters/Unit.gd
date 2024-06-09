extends CharacterBody2D
 
class_name Unit

static var ids = 0

@onready var animPlayer = $AnimationPlayer
@onready var sprite = $Sprite2D
var movePos = null

var id = 0

var side = ''

var title = ""
var bio = ""
var spells = []
var effects = []
var chrs = {}

var countMove = 1
var countActions = 1

var commandList = []

var cell = null

func _init():
	Unit.ids += 1
	id = Unit.ids
	chrsInit() 
	
func _ready():
	animPlayer.play('stay')
	hideShaderBlue()

# это шейдер свечения похожего на пламя
func showShaderBlue():
	sprite.material.set_shader_parameter('block_size', 2)	

func hideShaderBlue():
	sprite.material.set_shader_parameter('block_size', 0)	

func activeSpellAI(_spells):
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

func isLive():
	return !isDeath()
			
func actionAI():
	var freeCell = G.battleField.getFreeCell(self)

	var wishMove = RandomNumberGenerator.new().randi_range(1,2) == 1
	if freeCell && countMove > 0 && wishMove:
		countMove-=1
		cell.unit = null
		cell = freeCell
		movePos = cell.position
		commandList.append(CommandMove.new(self))
		return

	if (countActions > 0):
			countActions-=1
			activeSpell()
			return
			
	if (countActions == 0 && (countMove == 0 || freeCell == null || !wishMove)):
		G.battleController.nextUnit()
	
func checkActiveSpell(spell):	
	return spell.isActive()
		
func activeSpell():
	var activeSpells = spells.filter(checkActiveSpell)
	activeSpellAI(activeSpells)

func removeEffect(effect):
#	effects.remove_at()	
	pass
	
func damage(dmg):
	chrs.HP.minus(dmg)
	if isDeath():
		playAnim('death')
		if G.battleController.isCurrUnit(id):
			G.battleController.nextUnit()

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
	if (eff): 
		var currComm = getCurrCommand()
		if currComm as CommandCast && currComm.animationFunc:
			currComm.animationFunc.call()

func canAction():
	var isActive = G.battleController.isActive
	return isActive && isLive() && getCurrCommand() == null && G.battleController.isCurrUnit(id)

# направление и перемещение персонажа в зав-ти от его стороны или цели-позиции
func moveAndDirection():
	var currComm = getCurrCommand()
	var currCommIsMove = (currComm as CommandMove) || (currComm as CommandTelekines)
	if currCommIsMove && movePos:
		velocity = position.direction_to(movePos) * 200
		if  position.distance_to(movePos) > 3:
			move_and_slide()
			if (currComm as CommandMove):
				if movePos.x > position.x:
					sprite.scale.x = 1
				else:
					sprite.scale.x = -1
		else:
			if (currComm as CommandTelekines):
				currComm.endMove()
			movePos = null
			removeCommand(currComm.id)
			animPlayer.play('stay')
	else:	
		if (side == G.battleController.BATTLE_SIDES.ENEMY):
			sprite.scale.x = -1
		else:
			sprite.scale.x = 1

func _on_animation_player_animation_finished(_anim_name):
	var currComm = getCurrCommand()
	if currComm as CommandCast:
		currComm.endAnimation()

	if (isLive()):
		animPlayer.play('stay')

func _process(_delta):
	var currComm = getCurrCommand()
	if currComm:
		currComm.action()
	else:
		if canAction():
			actionAI()

func _physics_process(_delta):
	moveAndDirection()
