extends Node

@onready var music = $music

var exploration = load("res://common/music/Exploration.mp3")

func playExplore() -> void:
	music.stream = exploration
	music.play()

func stopMusic() -> void:
	music.playing = false
