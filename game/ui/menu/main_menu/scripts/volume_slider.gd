extends HSlider

@export var busName: String

var busIndex: int

func _ready() -> void:
	busIndex = AudioServer.get_bus_index(busName)
	
	value = db_to_linear(AudioServer.get_bus_volume_db(busIndex))

func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(busIndex, linear_to_db(value))

func _on_drag_ended(value_changed: bool) -> void:
	var config = ConfigFile.new()
	var err = config.load("user://audio_config.cfg")

	# Check if the file was loaded correctly or doesn't exist (create new)
	if err != OK:
		print("Config file not found, creating new one.")
		
	# Loop through all buses and save their values
	for i in range(AudioServer.get_bus_count()):
		var busName = AudioServer.get_bus_name(i)
		var volume = db_to_linear(AudioServer.get_bus_volume_db(i))
		config.set_value("audioBusLevels", busName, volume)
		
	# Save the updated config file
	var save_err = config.save("user://audio_config.cfg")
	if save_err != OK:
		print("Error saving audio config: ", save_err)
	else:
		return
