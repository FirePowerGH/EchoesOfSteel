extends Area2D

func _on_area_entered(_area: Area2D) -> void:
	var hp = get_parent().hp
	
	hp -= 1
	heartsUi.updateHearts(-1)
	
	print("New hp %s" % [str(hp)])
	if hp <= 0:
		# add actual death logic..
		print("player dead")
		get_tree().change_scene_to_file("res://game/ui/death/death_screen.tscn")
	
	get_parent().hp = hp
