extends RigidBody2D

@export var speed: float

@onready var startTimer = $"../elevatorStarter"
@onready var detector = $detector
@onready var elevator = $"."

@onready var leftDoor = $LeftDoor
@onready var rightDoor = $RightDoor

var elevatorMoving: bool = false

func _on_detection(_body: Node2D) -> void:
	startTimer.start()

func _on_elevator_timer_timeout() -> void:
	detector.monitoring = false
	elevatorMoving = true
	leftDoor.disabled = false
	rightDoor.disabled = false
	print("non-elevate")

func _physics_process(delta: float) -> void:
	if elevatorMoving:
		if global_position.y >= 1720:
			elevatorMoving = false
			leftDoor.disabled = true
			rightDoor.disabled = true
		else:
			global_position.y += speed * delta
