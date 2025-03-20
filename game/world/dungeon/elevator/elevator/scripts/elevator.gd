extends RigidBody2D

@onready var startTimer = $"../elevatorStarter"
@onready var detector = $detector
@onready var elevator = $"."

func _on_detection(body: Node2D) -> void:
	startTimer.start()

func _on_elevator_timer_timeout() -> void:
	detector.monitoring = false
	elevator.freeze = false
