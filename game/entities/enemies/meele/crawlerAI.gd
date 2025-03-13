extends CharacterBody2D

@onready var groundQuery = $raycast/groundQuery
@onready var sprite = $Icon

@export var speed: int

var direction = 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if is_on_wall() or !groundQuery.is_colliding():
		direction = direction * -1
		groundQuery.get_parent().scale.x = groundQuery.get_parent().scale.x * -1
		sprite.flip_h = sprite.flip_h == false
	
	move(direction)
	move_and_slide()

func move(direction):
	velocity.x = move_toward(velocity.x, direction * speed, 36.0)
