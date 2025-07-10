extends Control

func _ready() -> void:
	connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	connect("mouse_exited", Callable(self, "_on_mouse_exited"))
	connect("button_down", Callable(self, "_on_control_button_down"))

func _on_mouse_entered() -> void:
	G.battleController.unitMouseEnteredHandler(get_parent())

func _on_mouse_exited() -> void:
	G.battleController.unitMouseEnteredHandler(null)

func _on_control_button_down() -> void:
	G.battleController.unitMouseLeftClickHandler(get_parent())
