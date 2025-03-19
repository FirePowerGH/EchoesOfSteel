extends CanvasLayer

func _on_resume_pressed() -> void:
	self.hide()

func _on_exit_pressed() -> void:
	get_tree().quit()
