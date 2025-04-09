extends Control

var playing = false

func _ready() -> void:
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
