extends Control

func _ready() -> void:
	connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	connect("mouse_exited", Callable(self, "_on_mouse_exited"))

func _on_mouse_entered() -> void:
	G.battleController.unitMouseEnteredHandler(get_parent())

func _on_mouse_exited() -> void:
	G.battleController.unitMouseEnteredHandler(null)

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
			G.showModalInfo(get_parent().unitName, get_parent().unitInfo())
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			G.battleController.unitMouseLeftClickHandler(get_parent())
