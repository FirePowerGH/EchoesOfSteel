extends RigidBody2D

@export var speed: float

@onready var startTimer = $"../elevatorStarter"
@onready var detector = $detector
@onready var elevator = $"."

@onready var leftDoor = $LeftDoor
@onready var rightDoor = $RightDoor

@onready var rootNode = get_tree().current_scene

var elevatorMoving: bool = false
var inVator: bool = false

func _on_detection(_body: Node2D) -> void:
	startTimer.start()
	inVator = true

func _on_detector_exited(body: Node2D) -> void:
	inVator = false

func _on_elevator_timer_timeout() -> void:
	if inVator:
		detector.monitoring = false
		elevatorMoving = true
		leftDoor.disabled = false
		rightDoor.disabled = false
		print("non-elevate")
	else:
		print("returne")
		return

func _physics_process(delta: float) -> void:
	if elevatorMoving:
		if global_position.y >= 1720:
			elevatorMoving = false
			leftDoor.disabled = true
			rightDoor.disabled = true
			
			rootNode.get_node("elevatorCam").enabled = false
			rootNode.get_node("Player").get_node("camConnect").remote_path = "../../tunnelCam"
		else:
			global_position.y += speed * delta
