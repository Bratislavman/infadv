extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(666)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	print(5656565)
