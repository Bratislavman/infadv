extends Control

class_name ModalInfo

@onready var _title = $Control/Title
@onready var _text = $Control/PanelContainer/Text

static func formatText(text, lineBreak = false):
	text = '[p]' + text + '[/p]'
	if lineBreak:
		text += '[p] [/p]'
	return text

func init(title, text):
	_title.text = title
	_text.text = text

func _on_close_button_down() -> void:
	G.closeModalInfo()
