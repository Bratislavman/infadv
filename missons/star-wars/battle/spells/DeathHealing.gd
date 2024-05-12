extends Node2D

var animPlayer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	animPlayer = get_node("Sprite2D/AnimationPlayer")
	animPlayer.play('stay')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func playAnim(anim):
	animPlayer.play(anim)


func _on_animation_player_animation_finished(anim_name):
	print(anim_name, 'anim_name')
