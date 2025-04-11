extends Control

var playing = false

# Preload the scene that contains the save_keys_to_file() function
var KeybindsScene = preload("res://game/ui/menu/main_menu/controls/controls.tscn")

func _ready() -> void:
	# Check if the keybindings configuration file exists
	if not FileAccess.file_exists("user://keybindings.cfg"):
		# Instantiate the scene
		var keybinds_instance = KeybindsScene.instantiate()
		keybinds_instance.visible = false
		
		# Add the instance to the current scene tree
		add_child(keybinds_instance)
		
		# Optionally, you can call the function directly if it's needed immediately
		keybinds_instance.save_keys_to_file()
	else:
		print("Keybinds config file exists.")
	
	await get_tree().process_frame
	if not MusicController.isPlaying():
		MusicController.playTitle()

func _on_play() -> void:
	MusicController.stopMusic()
	playing = true
	get_tree().change_scene_to_file("res://game/world/overworld/world.tscn")

func _on_exit() -> void:
	get_tree().quit()

func _on_options_pressed() -> void:
	print(get_tree().get_current_scene())
	get_tree().change_scene_to_file("res://game/ui/menu/main_menu/options.tscn")
