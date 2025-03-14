extends Node

@export var hp: int

func _process(delta: float) -> void:
	if hp <= 0:
		get_parent().queue_free()
