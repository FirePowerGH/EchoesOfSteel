extends Node2D

func _ready() -> void:
	if levelSecretary.backItUp:
		$Player.position = Vector2(361, 146)
		levelSecretary.backItUp = false
