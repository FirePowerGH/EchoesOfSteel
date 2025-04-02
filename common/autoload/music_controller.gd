extends Node

@onready var music = $music

var exploration = load("res://common/music/Exploration.mp3")
var titleMusic = load("res://common/music/FadingIntent.mp3")

func _ready() -> void:
	loadAudioSettings()

func playExplore() -> void:
	music.stream = exploration
	music.play()

func playTitle() -> void:
	music.stream = titleMusic
	music.play()

func stopMusic() -> void:
	music.playing = false

func isPlaying():
	return music.playing

func loadAudioSettings() -> void:
	var config = ConfigFile.new()
	var err = config.load("user://audio_config.cfg")
	if err == OK:
		for i in range(AudioServer.get_bus_count()):
			var busName = AudioServer.get_bus_name(i)
			var volume = config.get_value("audioBusLevels", busName, 1.0)  # Default to full volume if not found
			AudioServer.set_bus_volume_db(i, linear_to_db(volume))
