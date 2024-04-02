extends Node2D
 
class_name Unit

var animPlayer = null

static var ids = 0

var id = 0

var side = ''

var title = ""
var bio = ""
var spells = []
var effects = []
var chrs = {}

var positionPlace = null

var countMove = 1
var countActions = 1

func _init(name, bio = "", side = ""):
	self.title = name
	self.bio = bio
	self.side = side
	Unit.ids += 1
	id = Unit.ids
	chrsInit() 
	
func _ready():
	animPlayer = get_node("Sprite2D/AnimationPlayer")
	animPlayer.play('stay')

func chrsInit():
	#	chrs = {
#		[Сharacteristic.CHARACTERISTICS.HP]: СharacteristicWithMax.new(Сharacteristic.CHARACTERISTICS.HP, hp),
#		[Сharacteristic.CHARACTERISTICS.DMG]: Сharacteristic.new(Сharacteristic.CHARACTERISTICS.DMG, dmg),
#	}
	pass

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
	if (countMove > 0 && RandomNumberGenerator.new().randi_range(1,2) == 1):
		countMove-=1
		G.battleController.moveUnit(self)
		
	if (countActions > 0):
		countActions-=1
		activeSpell()
			
	if (countMove == 0 || countActions == 0):
		G.battleController.nextUnit()
	
func getActiveSpells(spell):	
	return spell.isActive()
		
func activeSpell():
	var activeSpells = spells.filter(getActiveSpells)
	actionAI(activeSpells)

func removeEffect(effect):
#	effects.remove_at()	
	pass
	
func actionAI(spells):
	pass
	
func playAnim(anim):
	animPlayer.play(anim)

func _on_animation_player_animation_finished(anim_name):
	print(anim_name, 'anim_name')
