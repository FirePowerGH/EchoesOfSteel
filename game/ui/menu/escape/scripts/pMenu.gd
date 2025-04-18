extends CanvasLayer

signal options

func _on_resume_pressed() -> void:
	self.hide()
	get_tree().paused = false

func _on_exit_pressed() -> void:
	#get_tree().paused = false
	#get_tree().change_scene_to_file("res://game/ui/menu/main_menu/main_menu.tscn")
	get_tree().quit()
	OS.create_instance([])

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("menu"):
		if get_tree().paused:
			self.hide()
			get_tree().paused = false
		else:
			self.show()
			get_tree().paused = true

func _on_options_pressed() -> void:
	self.hide()
	emit_signal("options")

func _on_options_open_escape() -> void:
	self.show()
