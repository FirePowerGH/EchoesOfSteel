extends CanvasLayer

signal open_options

func _on_back_pressed() -> void:
	if get_parent().is_in_group("player"):
		self.hide()
		emit_signal("open_options")
	else:
		get_tree().change_scene_to_file("res://game/ui/menu/main_menu/options.tscn")

func _on_options_open_audio() -> void:
	self.show()
