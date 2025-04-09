extends CanvasLayer

signal open_escape
signal open_controls
signal open_audio

func _on_back_pressed() -> void:
	if get_parent().is_in_group("player"):
		self.hide()
		emit_signal("open_escape")
	else:
		get_tree().change_scene_to_file("res://game/ui/menu/main_menu/main_menu.tscn")

func _on_audio_pressed() -> void:
	if get_parent().is_in_group("player"):
		self.hide()
		emit_signal("open_audio")
	else:
		get_tree().change_scene_to_file("res://game/ui/menu/main_menu/audio/audio.tscn")

func _on_controls_pressed() -> void:
	if get_parent().is_in_group("player"):
		self.hide()
		emit_signal("open_controls")
	else:
		get_tree().change_scene_to_file("res://game/ui/menu/main_menu/controls/controls.tscn")

func _on_player_menu_options() -> void:
	self.show()

func _on_audio_open_options() -> void:
	self.show()

func _on_controls_open_options() -> void:
	self.show()
