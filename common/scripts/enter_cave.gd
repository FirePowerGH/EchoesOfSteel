extends Area2D

func _on_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file.call_deferred("res://game/world/dungeon/elevator/elevator.tscn")
