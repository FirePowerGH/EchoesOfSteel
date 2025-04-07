extends CanvasLayer

func _ready() -> void:
	update_keybind_label()

func _process(_delta: float) -> void:
	pass

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://game/ui/menu/main_menu/options.tscn")

func get_action_key_text(action_name: String) -> String:
	var events = InputMap.action_get_events(action_name)
	for event in events:
		if event is InputEventKey:
			return OS.get_keycode_string(event.physical_keycode)
	return "Unbound"

func update_keybind_label() -> void:	
	for container in $CenterContainer/VBoxContainer/HBoxContainer.get_children():
		for button in container.get_children():
			if button is Button:
				var action = button.name.to_lower()
				var key = get_action_key_text(action)
				print(action, " == ", key)
				button.text = action.to_upper() + ": " + key
