extends Area2D

func _on_death_area_entered(_body: Node2D) -> void:
	get_tree().reload_current_scene()
