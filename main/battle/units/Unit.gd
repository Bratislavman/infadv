extends Node

class_name Unit

var icon
var commands:Array = []
var attributes:Dictionary = {}
var spells:Array[Spell] = [SpellAttack.new(self)]
var side
var actionCount = 1

@onready var _animation_player = $AnimationPlayer
@onready var _sprite = $Sprite2D

func init():
	playAnim("stay")

func _ready() -> void:
	init()

# инвертируем спрайт к цели во время действия
func spriteInvert(target) -> void:
	if target:
		_sprite.flip_h = target.x < self.x

func initTargetAction() -> void:
	pass

func removeCommand():
	commands.pop_front()

func isLive():
	return attributes[Attributes.attrNameHp].value > 0

func isDeath():
	return attributes[Attributes.attrNameHp].value > 0
	
func dmg(damage):
	attributes[Attributes.attrNameHp].minus(damage)
	if (isDeath()):
		playAnim("death")
	
func playAnim(animName):
	if _animation_player:
		_animation_player.play(animName)
		
func actionAnimation():
	commands[0].actionAnimation()
	
func endAnimation():
	commands[0].endAnimation()

func _process(delta: float) -> void:
	if G.battleController.isCurrUnit(get_instance_id()):
		if actionCount > 0:
			for spell in spells:
				if spell is SpellAttack:
					var target = G.battleController.getEnemyList(self).pick_random()
					spell.action(target)
			actionCount-=1			

		if commands.size() == 0:
			actionCount = 1
			G.battleController.nextUnit()
