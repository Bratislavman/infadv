extends Node2D

var npc = null

# Called when the node enters the scene tree for the first time.
func _ready():
		G.mission.hell()
		get_tree().call_group('all', 'chc')
		get_node("bg").texture = preload('res://missons/star-wars/battle/battles/beast/bg.jpg')
		var rexScene = preload('res://missons/star-wars/battle/characters/rex/Rex.tscn')
		npc = rexScene.instantiate()
		var heroPost = get_node("Cell1_3Hero")
		npc.position = heroPost.position
		add_child(npc)
		
		
	


func hell():
	print('hell')


func _input(event):
	if (npc):
		if event is InputEventKey and event.pressed:
			if event.keycode == KEY_U:
				npc.playAnim('attack')
				
