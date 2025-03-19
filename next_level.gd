extends Area2D

func _ready() -> void:
	randomize()

func _on_body_entered(body: Node2D) -> void:
	var roomNum = randi() % 10
	get_tree().change_scene_to_file.call_deferred("res://game/world/dungeon/rooms/room%s.tscn" % [str(roomNum)])
