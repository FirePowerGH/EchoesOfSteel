extends Area2D

@export var sword_dmg: int

#func _on_body_entered(body: Node2D) -> void:
	#print("Sword hit:", body.name)
	#if body.has_node("HpController"):
		#var hp_controller = body.get_node("HpController")
		#hp_controller.on_hp_updated(sword_dmg)

func _on_area_entered(area: Area2D) -> void:
	print("Sword hit:", area.name)
	if area.has_node("HpController"):
		var hp_controller = area.get_node("HpController")
		hp_controller.on_hp_updated(sword_dmg)
