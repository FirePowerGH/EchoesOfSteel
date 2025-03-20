extends Node2D

func _ready() -> void:
	levelSecretary.updateList(String(get_tree().current_scene.name))
