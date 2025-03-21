extends StaticBody2D

@export var hp: int

@onready var win = $"../win"
@onready var sprite = $cube
@onready var eyes = $"../screens/eyes"

func _ready() -> void:
	sprite.play("fix")

func _process(delta: float) -> void:
	if hp <= 1:
		sprite.play("broke")
		hp = 999999999
		eyes.hide()
		sprite.global_position.y += 12
		win.visible = true
	elif hp <= 26:
		sprite.play("bigCrack")
	elif hp <= 51:
		sprite.play("crack")
	else:
		return
