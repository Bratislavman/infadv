extends Control

class_name Unit

static var unitTypeList = {
	'animal': 'animal',
	'flying': 'flying',
	'foot': 'foot',
}

var unitName = ''
var unitBio = ''
var icon
var commands:Array[CommandParent] = []
var attributes:Dictionary = {}
var spells:Array[Spell] = [SpellAttack.new(self)]
var effects = []
# сторона боя
var side
var actionCount = 1
# значит перс под прямым управлением через интерфейс
var isPlayerHero = false
var scaleXSize = null
# тут всё что-угодно, например тип животное или то, что существо летает
var tags: Array[String] = [Unit.unitTypeList.foot]

@onready var _animation_player = $AnimationPlayer
@onready var _sprite = $Sprite2D
@onready var _mouse_hendler_area = $Control

func init():
	scaleXSize = scale.x
	playAnim("stay")

func _ready() -> void:
	init()

func spellsInfo():
	var text = ''

	if spells.size():
		text += ModalInfo.formatText('[font_size=18][b]Способности:[/b][/font_size]', true)
		for spell in spells:
			text += spell.getInfo()

	return text

func effectsInfo():
	var text = '[p] [/p]'

	if effects.size():
		text += ModalInfo.formatText('[font_size=18][b]Эффекты:[/b][/font_size]', true)
		for effect in effects:
			text += effect.getInfo()

	return text	

func unitInfo():
	return ModalInfo.formatText(unitBio, true) + spellsInfo()  + effectsInfo()

# инвертируем спрайт к цели во время действия
func spriteInvert(target) -> void:
	if target:
		if target.position.x < self.position.x:
			scale.x = scaleXSize*-1
		else:
			scale.x = scaleXSize

func initTargetAction() -> void:
	pass

func isLive():
	return attributes[Attributes.attrNameHp].value > 0

func isDeath():
	return attributes[Attributes.attrNameHp].value == 0
	
func dmg(damage):
	attributes[Attributes.attrNameHp].minus(damage)
	if (isDeath()):
		playAnim("death")

func health(hp):
	if (isLive()):
		attributes[Attributes.attrNameHp].plus(hp)	
	
func playAnim(animName):
	if _animation_player:
		_animation_player.play(animName)
		
func actionAnimation():
	commands[0].actionAnimation()
	
func endAnimation():
	commands[0].endAnimation()

func remove():
	if commands.size():
		for command in commands:
			command.remove()
	commands = []

	if spells.size():
		for spell in spells:
			spell.remove()
	spells = []

	if effects.size():
		for effect in effects:
			effect.remove()
	effects = []
	
	var index = G.battleController.unitList.find(self)
	if index > -1:
		G.battleController.unitList.remove_at(index)

	queue_free()

func checkCurrentCommand(command):
	return command == commands[0]	

func endTurn():
	actionCount = 1
	G.battleController.nextUnit()

func unitIsEnemy(unit):
	return side != unit.side

func unitIsFriend(unit):
	return !unitIsEnemy(unit)

func useSpell(spell, targetList = []):
	if spell && spell.isActive():
		var target = null

		# либо цель одна, либо берём случайного персонажа(для ИИ)
		if targetList.size():
			target = targetList[0]
		else:
			var unitList = []

			if spell.targetType == Spell.targetTypeList.enemy:
				unitList = G.battleController.getEnemyList(self)

			if spell.targetType == Spell.targetTypeList.frendly:
				unitList = G.battleController.getFriendList(self)

			target = unitList.pick_random()	

		spriteInvert(target)

		spell.action(target)

	actionCount-=1

	G.battleController.playerSelectSpell(null)

func startTurn():
	reloadSpells()
	useEffects()

func reloadSpells():
	for spell in spells:
		spell.reload()

func useEffects():
	var haveEndTurn = false
	if effects.size():
		for effect in effects:
			effect.effectAction()
			if effect.isEndTurnUnit:
				haveEndTurn = true
	
	if haveEndTurn:
		CommandEndTurn.new(self)

func ai():
	# TODO потом сделать, что бы сначала выбирало цель, потом в вайле подбирало подходящий спел(например атака по лет противнику)
	var activeSpells = []

	for spell in spells:
		spell.reload()
		if spell.isActive():
			activeSpells.append(spell)

	if activeSpells.size():
		var spell = activeSpells.pick_random()
		useSpell(spell)

func _process(delta: float) -> void:
	if G.battleController.isCurrUnit(get_instance_id()):
		if (isPlayerHero):
			#если перс мёртв, без команд и очков действий, то переход хода 
			if (commands.size() == 0 && actionCount == 0) || isDeath():
				endTurn()
		else:
			if isLive() && actionCount > 0:	
				ai()

			#если юнит не заюзал спел, то команд не будет, значит спелы не заюзать и поэтому переход хода
			if commands.size() == 0:
				endTurn()
