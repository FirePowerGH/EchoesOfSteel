extends Node

@onready var invincibility = $invincibilityTimer

func on_hp_updated(dmg: int) -> void:
	if !invincibility.is_stopped():
		return
	
	var enemyNode = get_parent().get_parent()
	var hp = enemyNode.hp
	
	hp -= dmg
	
	invincibility.start()
	
	if hp <= 0:
		enemyNode.queue_free()
	
	enemyNode.hp = hp
