extends Control

@onready var deathTimer = $deathTimer

func _ready() -> void:
	deathTimer.start()

func _process(_delta: float) -> void:
	if deathTimer.is_stopped():
		get_tree().quit()
		OS.create_instance([])
