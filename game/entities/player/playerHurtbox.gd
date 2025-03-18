extends Area2D

func _on_area_entered(_area: Area2D) -> void:
	var hp = get_parent().hp
	print(hp)
