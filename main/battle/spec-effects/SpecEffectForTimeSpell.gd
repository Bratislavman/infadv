extends Node2D

# спецэффект для временного эффекта
class_name SpecEffectForTimeSpell

@onready var _animation_player = $AnimationPlayer

func init():
	_animation_player.play('stay')

func remove():
	queue_free()		
