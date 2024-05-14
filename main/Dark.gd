extends CanvasLayer

@onready var animPlayer = $AnimationPlayer

var actionFunc = null

func blackout(action):
	if (action):
		actionFunc = action
		animPlayer.play('switch')

func action():
	if (actionFunc):
		actionFunc.call()
		actionFunc = null
