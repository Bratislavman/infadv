extends Control

func _ready() -> void:
	connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	connect("mouse_exited", Callable(self, "_on_mouse_exited"))

func _on_mouse_entered() -> void:
	G.battleController.unitMouseEnteredHandler(get_parent())

func _on_mouse_exited() -> void:
	G.battleController.unitMouseEnteredHandler(null)

func _input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
		G.battleController.unitMouseLeftClickHandler(get_parent())
