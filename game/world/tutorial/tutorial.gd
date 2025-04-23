extends Node2D

@onready var Camera = $Camera2D

func _on_change_camera_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("cameras")
		Camera.limit_left = -206
		Camera.limit_top = -200
