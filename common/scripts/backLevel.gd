extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	var backLevel = levelSecretary.adjacentLevels(String(get_tree().current_scene.name))[0]
	
	if !backLevel:
		get_tree().change_scene_to_file.call_deferred("res://game/world/dungeon/rooms/start_level.tscn")
		return
	
	get_tree().change_scene_to_file.call_deferred("res://game/world/dungeon/rooms/room_%s.tscn" % [str(backLevel)])
