extends Node

@onready var invincibility = $invincibilityTimer

func on_hp_updated(dmg: int) -> void:
	if !invincibility.is_stopped():
		return
	
	var hp = get_parent().hp
	
	hp -= dmg
	get_parent().hp = hp
	
	invincibility.start()
	
	if hp <= 0:
		get_parent().queue_free()
