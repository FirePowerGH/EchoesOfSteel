extends CanvasLayer

func _on_resume_pressed() -> void:
	self.hide()
	get_tree().paused = false

func _on_exit_pressed() -> void:
	get_tree().quit()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("menu"):
		if self.visible:
			self.hide()
			get_tree().paused = false
		else:
			self.show()
			get_tree().paused = true
