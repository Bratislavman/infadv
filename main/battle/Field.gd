extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
		G.mission.hell()
		get_tree().call_group('all', 'chc')
		get_node("bg").texture = preload('res://missons/star-wars/battle/battles/beast/bg.jpg')
	


func hell():
	print('hell')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
