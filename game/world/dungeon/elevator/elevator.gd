extends Node2D

func _ready() -> void:
	heartsUi.inithearts($Player.hp)
	
	if levelSecretary.backItUp:
		$Player.position = Vector2(938.51, 2348.148)
		$elevatorCam.enabled = false
		$Player/camConnect.remote_path = "../../tunnelCam"
		
		levelSecretary.backItUp = false
