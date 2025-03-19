extends Control

signal start_game()

func _on_play() -> void:
	get_tree().change_scene_to_file("res://game/world/overworld/world1/world1.tscn")
	emit_signal("start_game")
	

func _on_exit() -> void:
	get_tree().quit()
