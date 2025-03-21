extends Node2D

func _ready() -> void:
	levelSecretary.updateList(String(get_tree().current_scene.name))
	
	if levelSecretary.backItUp:
		var pos = Vector2(361, 146)
		
		if get_tree().current_scene.name == "2":
			pos = Vector2(380, 110)
		$Player.position = pos
		levelSecretary.backItUp = false
