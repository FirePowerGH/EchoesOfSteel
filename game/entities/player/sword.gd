extends Area2D

@export var sword_dmg: int

func _on_area_entered(area: Area2D) -> void:
	if area.has_node("HpController"):
		var hp_controller = area.get_node("HpController")
		hp_controller.on_hp_updated(sword_dmg)
