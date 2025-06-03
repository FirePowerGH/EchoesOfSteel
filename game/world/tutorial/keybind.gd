extends Label

@export var labelFor: String

var mouse_button_names = {
MOUSE_BUTTON_LEFT: "LMB",
MOUSE_BUTTON_RIGHT: "RMB",
MOUSE_BUTTON_MIDDLE: "MMB",
}

func _ready() -> void:
	
	var binds: String
	var displayedText: String
	var additionalText: String = ""
	var keys = []
	
	if labelFor == "walk":
		displayedText = "Walk using: "
		keys = ["left", "right"]
	
	if labelFor == "jump":
		displayedText = "Jump using: "
		keys = ["jump"]
	
	if labelFor == "dash":
		displayedText = "Dash using: "
		keys = ["dash"]
	
	if labelFor == "attack":
		displayedText = "Attack using: "
		keys = ["attack"]
	
	if labelFor == "walljump":
		displayedText = "Walljump using "
		additionalText = " while touching a wall."
		keys = ["jump"]
	
	for key in keys:
		var bind = get_action_key_text(key)
		if binds != "":
			binds += " / "
		binds += bind

	self.text = displayedText + binds + additionalText

func get_action_key_text(action_name: String) -> String:
	var events = InputMap.action_get_events(action_name)
	for event in events:
		if event is InputEventKey:
			return OS.get_keycode_string(event.physical_keycode)
		elif event is InputEventMouseButton:
			return mouse_button_names.get(event.button_index, "Unknown Mouse Button")
	return "Unbound"

func update_keybind_label() -> void:
	for container in $CenterContainer/VBoxContainer/HBoxContainer.get_children():
		for button in container.get_children():
			if button is Button:
				var action = button.name.to_lower()
				var key = get_action_key_text(action)
				button.text = action.to_upper() + key
