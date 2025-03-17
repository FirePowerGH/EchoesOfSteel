extends CharacterBody2D

@onready var eye = $EyePart
@onready var player = $"../Player"

var playerPos

func _process(delta: float) -> void:
	playerPos = player.global_position
	eye.look_at(playerPos)
	# eye.rotate_toward(eye.global_rotation, playerPos, 36.0)
