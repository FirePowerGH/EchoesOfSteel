extends Control

func _on_play() -> void:
	get_tree().change_scene_to_file("res://game/world/overworld/world.tscn")

func _on_exit() -> void:
	get_tree().quit()
