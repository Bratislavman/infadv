extends Node2D

@export var x = 1
@export var y = 1
@export var side = ''

var unit = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func chc():
	get_node("rect").color = 'red'
