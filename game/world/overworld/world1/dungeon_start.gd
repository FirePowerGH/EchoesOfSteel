extends Area2D

var readyToGo = false

@onready var toolTips = $toolTips

func toolTipsState(enter: bool) -> void:
	toolTips.visible = enter

func _on_body_entered(_body: Node2D) -> void:
	readyToGo = true

func _on_body_exited(_body: Node2D) -> void:
	readyToGo = false
	toolTipsState(false)

func _process(_delta: float) -> void:
	if readyToGo:
		toolTipsState(true)
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene_to_file("res://game/world/overworld/test_world/dungeonTypeShit.tscn")
