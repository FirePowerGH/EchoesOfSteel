extends Area2D

var readyToGo = false

@onready var enterLabel = $enterLabel

func _on_body_entered(_body: Node2D) -> void:
	readyToGo = true

func _on_body_exited(_body: Node2D) -> void:
	readyToGo = false
	enterLabel.visible = false

func _process(_delta: float) -> void:
	if readyToGo:
		enterLabel.visible = true
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene_to_file("res://game/world/overworld/test_world/dungeonTypeShit.tscn")
