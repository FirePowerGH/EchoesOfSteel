extends CanvasLayer

@onready var container = $HBoxContainer
@onready var heart = $HBoxContainer/heart

var maxHearts

func inithearts(hearts: int) -> void:
	maxHearts = hearts
	
	for i in (hearts - 1):
		container.add_child(heart.duplicate())
