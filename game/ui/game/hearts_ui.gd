extends CanvasLayer

@onready var container = $HBoxContainer
@onready var heart = $HBoxContainer/heart

var maxHearts

func inithearts(hearts: int) -> void:
	maxHearts = hearts
	
	add_child(heart.duplicate())
