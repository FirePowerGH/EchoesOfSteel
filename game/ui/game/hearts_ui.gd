extends CanvasLayer

@onready var container = $HBoxContainer
@onready var heart = $HBoxContainer/heart

var maxHearts
var hp

func inithearts(hearts: int) -> void:
	maxHearts = hearts
	hp = hearts
	
	heart.play("alive")
	
	for i in (hearts - 1):
		var newHeart = heart.duplicate()
		container.add_child(newHeart)
		newHeart.position.x = container.get_child_count() * 40
		
		newHeart.play("alive")

# Hearts er enten 1 eller -1, depending on du skal fjerne eller adde hjerter
# Adder bare support for å miste ett hjerte om gangen, kan endre på dette senere if needed
func updateHearts(hearts: int) -> void:
	if hearts > maxHearts:
		return
	
	if hearts > 0:
		pass # kan adde support for healing
	else:
		hp -= 1
		var heartTexture = container.get_child(hp)
		
		heartTexture.play("broken")
