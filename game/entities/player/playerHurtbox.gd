extends Area2D

@onready var hp = get_parent().hp

func _on_area_entered(_area: Area2D) -> void:
	hp -= 1
	
	heartsUi.updateHearts(-1)
	
	get_parent().hp = hp
	if hp <= 0:
		get_tree().change_scene_to_file.call_deferred("res://game/ui/death/death_screen.tscn")
