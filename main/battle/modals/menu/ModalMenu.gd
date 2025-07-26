extends Control

class_name ModalMenu

func _on_exit_button_down() -> void:
	get_tree().quit()

func _on_help_button_down() -> void:
	G.modalMenu.visible = false

	var text = """
Слева вверху иконка персонажа, его способности и очередь ходов персонажей.

Правой кнопкой мыши можно нажимать на всё перечисленное, а также самих персонаже, 
что бы прочитать подробную информацию о них.

Способности персонажа активируются через клик левой кнопкой мыши,
а деактивируются через правую кнопку мыши.

Правее панели героя кнопка пропуска хода.
	"""
	G.showModalInfo('Помощь', text)

func _on_close_button_down() -> void:
	G.modalMenu.visible = false
