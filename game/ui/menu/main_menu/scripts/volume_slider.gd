extends HSlider

@export var busName: String

var busIndex: int

func _ready() -> void:
	busIndex = AudioServer.get_bus_index(busName)
	
	value = db_to_linear(AudioServer.get_bus_volume_db(busIndex))

func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(busIndex, linear_to_db(value))

func _on_drag_ended(value_changed: bool) -> void:
	value = db_to_linear(AudioServer.get_bus_volume_db(busIndex))
	print(value)
