extends CanvasLayer

@onready var container = $HBoxContainer
@onready var heart = $HBoxContainer/heart

var initiated = false
var maxHearts
var hp

func inithearts(hearts: int) -> void:
	if initiated:
		return
	
	maxHearts = hearts
	hp = hearts
	
	for i in (hearts):
		var newHeart = heart.duplicate()
		newHeart.visible = true
		container.add_child(newHeart)
		newHeart.position.x = (container.get_child_count() -1) * 35
		
		newHeart.play("alive")
	
	heart.queue_free()
	initiated = true

# Hearts er enten 1 eller -1, depending on du skal fjerne eller adde hjerter
# Adder bare support for å miste ett hjerte om gangen, kan endre på dette senere if needed
func updateHearts(hearts: int) -> void:
	if hearts > maxHearts:
		return
	
	if hearts > 0:
		pass # kan adde support for healing later
	else:
		hp -= 1
		print(hp)
		var heartTexture = container.get_child(hp)
		
		heartTexture.play("broken")
