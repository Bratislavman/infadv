extends Node

func test():
	print('miss have')
	
# Called when the node enters the scene tree for the first time.
func _ready():
	print('111')
	G.mission = self
	G.mission.test()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
