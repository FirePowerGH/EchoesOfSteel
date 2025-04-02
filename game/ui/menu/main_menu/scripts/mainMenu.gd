extends Control

func _ready() -> void:
	await get_tree().process_frame
	if not MusicController.isPlaying():
		MusicController.playTitle()

func _on_play() -> void:
	MusicController.stopMusic()
	get_tree().change_scene_to_file("res://game/world/overworld/world.tscn")

func _on_exit() -> void:
	get_tree().quit()

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://game/ui/menu/main_menu/options.tscn")
