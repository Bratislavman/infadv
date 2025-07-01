extends CanvasLayer

@onready var animPlayer = $AnimationPlayer

var actionFunc = null

func blackout(action):
	if (action):
		actionFunc = action
		animPlayer.play('switch')
		visible = true

func action():
	if (actionFunc):
		actionFunc.call()
		actionFunc = null
		visible = false
