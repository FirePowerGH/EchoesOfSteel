extends CanvasLayer

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://game/ui/menu/main_menu/main_menu.tscn")

func _on_audio_pressed() -> void:
	get_tree().change_scene_to_file("res://game/ui/menu/main_menu/audio/audio.tscn")

func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://game/ui/menu/main_menu/controls/controls.tscn")
